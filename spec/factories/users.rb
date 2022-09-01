FactoryBot.define do
  factory :user do
    last_name { '山田' }
    first_name { '太郎' }
    email { Faker::Internet.free_email }
    password {'1a' + Faker::Internet.password(min_length: 4) }
    encrypted_password { password }
    first_name_fgn { 'タロウ' }
    last_name_fgn { 'ヤマダ' }
    nick_name { Faker::Name.name }
    birthday { Faker::Date.between(from: '2014-09-23', to: '2014-09-28') }
  end
end
