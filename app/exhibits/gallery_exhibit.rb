class GalleryExhibit < DisplayCase::Exhibit
  include ExhibitBaseHelper

  def self.applicable_to?(object)
    object.class.name == 'Gallery'
  end

  exhibit_query :paintings
end
