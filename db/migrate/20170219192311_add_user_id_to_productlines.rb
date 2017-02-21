class AddUserIdToProductlines < ActiveRecord::Migration[5.0]
  def change
    add_column :productlines, :user_id, :integer
  end
end
