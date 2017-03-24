class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :productcode
      t.string :productname
      t.string :productscale
      t.string :productvendor
      t.text :productdescription
      t.integer :quantityinstock
      t.decimal :buyprice
      t.decimal :msrp

      t.timestamps
    end
  end
end
