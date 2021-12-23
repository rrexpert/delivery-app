class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.integer :supplier_id, null: false
      t.references :category, null: false, foreign_key: true
      t.string :sku
      t.string :name
      t.string :description
      t.float :price

      t.timestamps
    end
  end
end
