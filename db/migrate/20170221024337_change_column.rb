class ChangeColumn < ActiveRecord::Migration[5.0]
  def change
  	change_column :productlines, :textdescription, :text
  end
end
