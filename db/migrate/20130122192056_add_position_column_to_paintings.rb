class AddPositionColumnToPaintings < ActiveRecord::Migration[6.1]
  def change
    add_column :paintings, :position, :integer
  end
end
