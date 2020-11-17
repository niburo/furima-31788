class CreateAddressePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :addresse_purchases do |t|
      t.timestamps
      t.integer :price  ,null: false
    end
  end
end
