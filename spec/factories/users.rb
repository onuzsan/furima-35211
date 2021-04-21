FactoryBot.define do
  factory :user do
    nickname { 'やまん' }
    email { Faker::Internet.free_email }
    encrypted_password = (Faker::Internet.password + 'a1')
    password { encrypted_password }
    password_confirmation { encrypted_password }
    first_name { '山田' }
    last_name { '太郎' }
    first_name_kana { 'ヤマダ' }
    last_name_kana { 'タロウ' }
    date { Faker::Date.birthday }
  end
end
