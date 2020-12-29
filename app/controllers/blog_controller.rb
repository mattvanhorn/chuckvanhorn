class BlogController < ApplicationController
  expose(:posts){ Post.published.recent }
  expose(:post)

  def index
    self.posts = exhibit(posts)
  end

  def show
    self.post = exhibit(post)
  end
end
