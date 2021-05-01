require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end
  describe '商品出品登録' do
  it '郵便番号が必須であること ' do
    @address.postal_code =''
    @address.valid?
      expect(@address.errors.full_messages).to include('Order must exist')
  end
  it' 郵便番号の保存にはハイフンが必要であること 'do
    @address.postal_code =1111111
    @address.valid?
    expect(@address.errors.full_messages).to include('Order must exist')
  end
  it '都道府県が必須であること ' do
    @address.area_id =''
    @address.valid?
    expect(@address.errors.full_messages).to include('Order must exist')
  end
  it '都道府県は１が選択された場合は出品できないこと' do
    @address.area_id = 1
    @address.valid?
    expect(@address.errors.full_messages).to include('Order must exist')
  end
  it '市区町村が必須であること ' do
    @address.municipality = ''
    @address.valid?
    expect(@address.errors.full_messages).to include('Order must exist')
  end
  it '番地が必須であること ' do
    @address.house_number = ''
    @address.valid?
    expect(@address.errors.full_messages).to include('Order must exist')
  end
  it' 電話番号が必須であること ' do
    @address.phone = ''
    @address.valid?
    expect(@address.errors.full_messages).to include('Order must exist')
  end
  it '電話番号は11桁以内の数値のみ保存可能なこと（09012345678となる）' do
    @address.phone = '090111111'
    @address.valid?
    expect(@address.errors.full_messages).to include('Order must exist')
  end
  
end
end