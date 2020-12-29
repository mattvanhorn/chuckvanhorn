class GalleriesController < ApplicationController
  expose :gallery

  def show
    self.gallery = exhibit(gallery)
  end

  def portraits
    self.gallery = exhibit(gallery)
  end
end
