class Product < ActiveRecord::Base
  #atributes
  attr_accessible :description, :image_url, :price, :title
  #order on db
  default_scope order: 'title'

  #validation

  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true, length: {minimum: 10}
  validates :image_url, :format => {:with => /.(gif|jpg|png)$/i , :message => 'must be a ur for GIF, JPG or  PNG image'}
#  validates :image_url, :format => {:with => $r{\.(gif|jpg|png)$}i, message => 'must be a URL for GIF, JPG or PNG image.'}
end
