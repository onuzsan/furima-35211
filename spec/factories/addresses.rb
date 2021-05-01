FactoryBot.define do
  factory :address do
    postal_code { 145-1178 }
    area_id { 2 }
    municipality { '大田区' }
    house_number { '田園調布'}
    phone        { 17012345678 }
    
  end
end
