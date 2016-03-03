class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :brand
      t.string :title
      t.text :description
      t.string :size
      t.string :color
      t.string :category
      t.string :ean
      t.timestamps null: false
    end
  end
end
