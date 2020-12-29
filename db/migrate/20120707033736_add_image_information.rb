class AddImageInformation < ActiveRecord::Migration[6.1]
  def change
    add_column :paintings, :image_information, :string
  end
end
