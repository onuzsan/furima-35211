require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
  @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
  it '全て入力されている状態で保存出来る' do
    expect(@item).to be_valid
  end
  it '商品画像を1枚つけることが必須であること' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end
  it '商品名が必須であること' do
    @item.title= ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Title can't be blank")
  end
  it '商品の説明が必須であること' do
    @item.description = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Description can't be blank")
  end
  it 'カテゴリーの情報が必須であること' do
    @item.category_id= ''
    @item.valid?
    expect(@item.errors.full_messages).to include( "Category can't be blank", "Category is not a number")
  end
  it '商品の状態についての情報が必須であること' do
    @item.status_id= ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
  end
  it '配送料の負担についての情報が必須であること' do
    @item.shipping_id= ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping can't be blank", "Shipping is not a number")
  end
  it '発送元の地域についての情報が必須であること' do
    @item.area_id= ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Area can't be blank", "Area is not a number")
  end
  it '発送までの日数についての情報が必須であること' do
    @item.schedule_id= ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Schedule can't be blank", "Schedule is not a number")
  end
  it '販売価格についての情報が必須であること' do
    @item.price,= ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price can't be blank", "Price is invalid")
  end
  it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
    @item.price,= '100'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is invalid")
  end
  it '販売価格は半角数字のみ保存可能であること' do
    @item.price,= '４００'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is invalid")
  end
 end
end
