FactoryBot.define do
  factory :item do
    name { 'aaaaaaaaaaaa' }
    desctiption { 'aaaaaaaaaaaa' }
    category_id { 2 }
    condition_id { 2 }
    shipping_charge_id { 2 }
    shipping_area_id { 2 }
    days_to_ship_id { 2 }
    price { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/item.png'), filename: 'item.png')
    end
  end
end
