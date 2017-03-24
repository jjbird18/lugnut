class CreateProductlines < ActiveRecord::Migration[5.0]
  def change
    create_table :productlines do |t|
      t.string :textdescription
      t.text :htmldescription
      t.binary :image

      t.timestamps
    end
  end
end
