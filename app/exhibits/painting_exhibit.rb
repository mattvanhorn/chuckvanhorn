class PaintingExhibit < DisplayCase::Exhibit
  include ExhibitBaseHelper

  def self.applicable_to?(object)
    object.class.name == 'Painting'
  end

  def render_thumbnail
    make_image_tag image.small
  end

  def render_large
    make_image_tag image.large, :id => "painting_#{id}", :style => "margin-top: #{((790-image.large.height)/2)-40}px;"
  end

  private

  def make_image_tag(img, opts={})
    in_view.image_tag img, {:size => "#{img.width}x#{img.height}", :alt => title}.merge(opts)
  end
end
