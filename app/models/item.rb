class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  with_options presence: true do
   validates :image
   validates :title 
   validates :description
   validates :category_id
   validates :status_id
   validates :shipping_id
   validates :area_id
   validates :days_id
   validates :price
  end
end