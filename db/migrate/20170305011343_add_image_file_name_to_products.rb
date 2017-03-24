class AddImageFileNameToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :image_file_name, :text
  end
end
