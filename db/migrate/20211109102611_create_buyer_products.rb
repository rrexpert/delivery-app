class CreateBuyerProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :buyer_products do |t|
      t.integer :buyer_id
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
