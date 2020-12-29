class PaintingsController < ApplicationController
  expose(:gallery)
  expose(:paintings){ gallery.paintings }
  expose(:painting)

  def index
    self.paintings = exhibit(paintings)
  end

  def show
    self.painting = exhibit(painting)
  end
end
