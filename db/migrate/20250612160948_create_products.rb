class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.decimal :price
      t.references :brand, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
