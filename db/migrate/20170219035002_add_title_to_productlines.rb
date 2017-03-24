class AddTitleToProductlines < ActiveRecord::Migration[5.0]
  def change
    add_column :productlines, :title, :string
  end
end
