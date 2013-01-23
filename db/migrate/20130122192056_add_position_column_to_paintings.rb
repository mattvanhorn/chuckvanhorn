class AddPositionColumnToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :position, :integer
  end
end
