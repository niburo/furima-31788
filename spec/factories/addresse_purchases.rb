FactoryBot.define do
  factory :addresse_purchase do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    prefecture_id { "1" }
    municipality { '青山' }
    house_number { '1-1' }
    building_name {'ああ'}
    phone_number {'09012345678'}
    item_id {"8"}
    user_id {"8"}
  end
end
