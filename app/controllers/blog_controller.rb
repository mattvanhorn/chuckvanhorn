class BlogController < ApplicationController
  expose(:posts){ Post.published.recent }
  expose(:post)

  def index
    exhibit_exposed :posts
  end

  def show
    exhibit_exposed :post
  end
end
