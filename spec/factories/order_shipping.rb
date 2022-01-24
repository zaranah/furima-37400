FactoryBot.define do
  factory :order_shipping do
    postal_code { '000-0000' }
    prefecture_id { Faker::Number.between(from: 2, to: 30) }
    city {Faker::Address.city}
    addresses {Faker::Address.street_name}
    building {Faker::Address.secondary_address}
    phone_number {Faker::Number.number(digits: 10)}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
