class PaintingsController < ApplicationController
  expose(:gallery)
  expose(:paintings){ gallery.paintings.order("id ASC") }
  expose(:painting)

  def index
    exhibit_exposed :paintings
  end

  def show
    exhibit_exposed :painting
  end
end
