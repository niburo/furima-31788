FactoryBot.define do
  factory :item do
    association :user
    name {"test"}
    info {"test"}
    category_id {"3"}
    sales_status_id {"2"}
    shipping_fee_status_id {"2"}
    prefecture_id {"2"}
    price {"444"} 
    scheduled_delivery_id {"3"}

    after(:build) do |item|
      item.image.attach(io: File.open(‘spec/fixtures/test_image.jpg’), filename: ‘test_image.jpg’, content_type: ‘image/jpg’)
    end
  end
end