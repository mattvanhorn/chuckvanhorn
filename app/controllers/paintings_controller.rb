class PaintingsController < ApplicationController
  expose(:gallery)
  expose(:paintings){ gallery.paintings.order("created_at") }
  expose(:painting)

  def index
    exhibit_exposed :paintings
  end

  def show
    exhibit_exposed :painting
  end
end
