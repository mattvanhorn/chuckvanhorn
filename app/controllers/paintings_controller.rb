class PaintingsController < ApplicationController
  expose(:gallery)
  expose(:paintings){ gallery.paintings.order("id ASC") }
  expose(:painting)

  def index
    exhibit_exposed :paintings
  end
end
