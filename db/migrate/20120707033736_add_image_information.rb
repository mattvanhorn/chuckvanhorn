class AddImageInformation < ActiveRecord::Migration
  def change
    add_column :paintings, :image_information, :string
  end
end
