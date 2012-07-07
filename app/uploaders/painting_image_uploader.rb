# encoding: utf-8
# require 'carrier_wave/image_size'
class PaintingImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  # include CarrierWave::ImageSize

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  # storage :fog
  # storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "carrierwave/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    # For Rails 3.1+ asset pipeline compatibility:
    asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
    # "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end
  after :cache, :capture_size
  after :retrieve_from_cache, :capture_size
  attr_reader :geometry

  def height
    Rails.logger.info "VERSION=#{my_version_name}"
    Rails.logger.info "INFO=#{get_info[my_version_name]}"
    get_info[my_version_name].last
  end

  def width
    get_info[my_version_name].first
  end

  # Create different versions of your uploaded files:
  version :large do
    process :resize_to_limit => [800, 600]
    process :capture_size
  end

  version :small do
    process :resize_to_limit => [200, 200]
    process :capture_size
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  private

  def capture_size(*args)
    img = ::MiniMagick::Image::read(File.binread(@file.file))
    @geometry = [img[:width], img[:height]]
    set_info(get_info.merge(my_version_name => @geometry))
  end

  def info_field_name
    "#{mounted_as}_information"
  end

  def my_version_name
    (version_name || 'original').to_s
  end

  def get_info
    model.send( info_field_name ) || {}
  end

  def set_info(info)
    model.send( "#{info_field_name}=", info )
  end

end
