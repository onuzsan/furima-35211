FactoryBot.define do
  factory :order_address do
    postal_code { '145-1178' }
    area_id { 2 }
    municipality { '大田区' }
    house_number { '田園調布' }
    phone        { '01234567890' }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { 3 }
    item_id { 3 }
  end
end
