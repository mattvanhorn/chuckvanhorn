class GalleriesController < ApplicationController
  expose :gallery

  def show
    exhibit_exposed :gallery
  end

  def portraits
    exhibit_exposed :gallery
  end
end
