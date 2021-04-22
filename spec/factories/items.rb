FactoryBot.define do
  factory :item do
    
    title{'スニーカー'}
    description{'ご覧いただき'}
    category_id{ '2' }
    status_id{ '3' }
    shipping_id{ '2' }
    area_id{ '2' }
    schedule_id{ '2' }
    price{ '5000' }
    user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    
    end
  end
end
