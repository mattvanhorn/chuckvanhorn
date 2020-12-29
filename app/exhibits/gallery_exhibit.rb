class GalleryExhibit < DisplayCase::Exhibit
  include ExhibitBaseHelper

  def self.applicable_to?(object, context)
    object.class.name == 'Gallery'
  end

  exhibit_query :paintings
end
