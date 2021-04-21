FactoryBot.define do
  factory :user do
    nickname { 'やまん' }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password + 'a1' }
    password_confirmation { password }
    first_name { '山田' }
    last_name { '太郎' }
    first_name_kana { 'ヤマダ' }
    last_name_kana { 'タロウ' }
    birthday { Faker::Date.birthday }
  end
end
