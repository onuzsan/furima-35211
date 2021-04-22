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
   validates :price,numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
   validates :price,format: { with: /\A[0-9]+\z/}
  end
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id,   numericality: { other_than: 1 }
  validates :shipping_id, numericality: { other_than: 1 }
  validates :area_id,     numericality: { other_than: 1 }
  validates :schedule_id, numericality: { other_than: 1 }
  
end