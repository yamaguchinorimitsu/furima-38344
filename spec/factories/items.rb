FactoryBot.define do
  factory :item do
    content { 'テスト' }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id { '2' }
    condition_id { '2' }
    delivery_charge_id { '2' }
    delivery_time_id { '2' }
    prefecture_id { '2' }
    item_name { '2' }

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
