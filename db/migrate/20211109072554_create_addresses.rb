class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :address_line
      t.string :city
      t.string :postal_code
      t.string :state
      t.string :country
      t.integer :addressable_id
      t.string :addressable_type

      t.timestamps
    end
  end
end
