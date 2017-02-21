class AddProductlineToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :productline_id, :integer
  end
end
