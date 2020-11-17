class AddressePurchase < ApplicationRecord

    include ActiveModel::Model
    attr_accessor :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number, :order_id, :user_id, :item_id
    with_options presence: true do
      validates :postal_code,  format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
      validates :municipality
      validates :house_number
      validates :phone_number, format: { with: /\A[0-9]{10}+\z/i, message: "is invalid. Input half-width characters."}
    end
    validates :prefecture_id, numericality: { other_than: 0, message: "can’t be blank" }
    def save
     purchase = Purchase.create(item_id: item_id, user_id: user_id)
     Addresse.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality_id: municipality_id, house_number_id: house_number_id, building_name_id: building_name_id, phone_number: phone_number, purchases_id: purchases.id )
    end
  end