class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:postal_code,:area_id,:municipality,:house_number,:building,:phone

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 1 }
    validates :municipality
    validates :house_number
    validates :phone,format: {with: /\A\d{11}\z/}
    validates :user_id
    validates :item_id
  end 
  
    def save
      order = Order.create(item_id: item_id, user_id: user_id)
      # 住所を保存する
      Address.create(postal_code: postal_code, area_id: area_id, municipality: municipality, house_number: house_number, building: building, phone: phone,order_id: order.id )
    end
  
  end
