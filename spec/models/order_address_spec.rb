require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @address = FactoryBot.build(:order_address)
  end
  describe '商品出品登録' do
    it '全て入力されている状態で保存出来る' do
      expect(@address).to be_valid
    end
    it '郵便番号が必須であること ' do
      @address.postal_code = ''
      @address.valid?
      expect(@address.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid. Include hyphen(-)')
    end
    it ' 郵便番号の保存にはハイフンが必要であること ' do
      @address.postal_code = '1234567'
      @address.valid?
      expect(@address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it '都道府県が必須であること ' do
      @address.area_id = ''
      @address.valid?
      expect(@address.errors.full_messages).to include("Area can't be blank", 'Area is not a number')
    end
    it '都道府県は１が選択された場合は出品できないこと' do
      @address.area_id = 1
      @address.valid?
      expect(@address.errors.full_messages).to include('Area must be other than 1')
    end
    it '市区町村が必須であること ' do
      @address.municipality = ''
      @address.valid?
      expect(@address.errors.full_messages).to include("Municipality can't be blank")
    end
    it '番地が必須であること ' do
      @address.house_number = ''
      @address.valid?
      expect(@address.errors.full_messages).to include("House number can't be blank")
    end
    it ' 電話番号が必須であること ' do
      @address.phone = ''
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone can't be blank", 'Phone is invalid')
    end
    it '電話番号は11桁以内の数値のみ保存可能なこと（09012345678となる）' do
      @address.phone = '090111111'
      @address.valid?
      expect(@address.errors.full_messages).to include('Phone is invalid')
    end
    it 'tokenが空では登録できないこと' do
      @address.token = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
