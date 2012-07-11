class Post < ActiveRecord::Base
  attr_accessible :title, :body, :painting_id, :published_at
  belongs_to :painting
  scope :published, lambda{ where('published_at IS NOT NULL AND published_at < ?', Time.now) }
  scope :recent,    lambda{ order('published_at DESC') }

end
