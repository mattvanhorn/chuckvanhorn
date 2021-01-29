# painting.rb
class Painting < ApplicationRecord
  # attr_accessible :gallery_id,
  #                 :image,
  #                 :image_cache,
  #                 :title,
  #                 :note,
  #                 :sold,
  #                 :remove_image,
  #                 :remote_image_url,
  #                 :position
  serialize :image_information

  belongs_to :gallery

  mount_uploader :image, PaintingImageUploader
  validates_presence_of :image
  default_scope { order(:position) }
end
