class AddProductcodeToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :productcode, :string
  end
end
