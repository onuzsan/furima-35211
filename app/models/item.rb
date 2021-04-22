class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping
  belongs_to :area
  belongs_to :schedule

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
   validates :schedule_id
   validates :price
  end
end