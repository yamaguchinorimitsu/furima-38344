FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { '3' }
    city { '東京都' }
    house_number { '1-1' }
    tell_number { '02345678901' }
    token { '111111111111111111111111' }
    building{'建物テスト'}
  end
end
