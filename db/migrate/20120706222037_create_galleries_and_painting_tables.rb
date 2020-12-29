class CreateGalleriesAndPaintingTables < ActiveRecord::Migration[6.1]
  def change
    create_table :galleries, :force => true do |t|
      t.string :name
      t.timestamps
    end

    create_table :paintings, :force => true do |t|
      t.integer :gallery_id
      t.string :image
      t.string :title
      t.string :note
      t.boolean :sold
      t.timestamps
    end

    add_index :paintings, :gallery_id
  end
end
