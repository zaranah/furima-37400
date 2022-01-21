FactoryBot.define do
  factory :item do
    name { Faker::JapaneseMedia::OnePiece.character }
    info { Faker::Lorem.paragraphs }
    category_id { Faker::Number.between(from: 2, to: 4)}
    sales_status_id { Faker::Number.between(from: 2, to: 4)}
    shipping_fee_status_id { Faker::Number.between(from: 2, to: 4)}
    prefecture_id { Faker::Number.between(from: 2, to: 30)}
    scheduled_delivery_id { Faker::Number.between(from: 2, to: 4 )}
    price { Faker::Number.between(from: 300, to: 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
