FactoryBot.define do
  factory :item do
    content {'テスト'}
    image {Faker::Lorem.sentence}
    price {Faker::Number.between(from: 300, to: 9999999)}
    category_id {'2'}
    condition_id { '2'}
    delivery_charge_id {'2'}
    delivery_time_id {'2'}
    prefecture_id {'2'}
    item_name {'2'}


    association :user 
  end
end
