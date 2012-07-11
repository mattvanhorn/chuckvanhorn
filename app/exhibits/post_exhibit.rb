class PostExhibit < DisplayCase::Exhibit
  include ExhibitBaseHelper

  def self.applicable_to?(object)
    object.class.name == 'Post'
  end

  def render(*args)
    if excerpt_only?
      in_view.render :partial => 'posts/post_excerpt', :object => self
    else
      in_view.render :partial => 'posts/full_post', :object => self
    end
  end

  def excerpt
    link = in_view.link_to('read more', in_view.post_path(self))
    text = in_view.strip_tags(body)
    excerpt_text = in_view.truncate(text, :length => 200, :separator => ' ', :omission => "... ")
    (excerpt_text + link).html_safe
  end

  def excerpt_only?
    in_view.action_name == 'index'
  end

  def published_at
    to_model.published_at.to_date.to_s(:long)
  end
end
