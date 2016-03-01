class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :size
      t.string :price
      t.string :color
      t.string :product_type
      t.string :brand

      t.timestamps null: false
    end
  end
end
