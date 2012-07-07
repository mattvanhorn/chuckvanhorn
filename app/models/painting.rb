# painting.rb
class Painting < ActiveRecord::Base
  attr_accessible :gallery_id, :image, :image_cache, :title, :note, :sold, :remove_image
  serialize :image_information

  belongs_to :gallery

  mount_uploader :image, PaintingImageUploader

end
