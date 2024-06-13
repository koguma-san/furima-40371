require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep(0.5)
  end

  describe '商品購入' do

    context '商品購入できる場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品購入できない場合' do
      it 'tokenが空では登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空だと保存できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角でないと保存できない' do
        @order_address.post_code = '１２３-４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code must be in the format of 3 digits hyphen 4 digits")
      end
      it 'post_codeがハイフンなしでは保存できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code must be in the format of 3 digits hyphen 4 digits")
      end
      it 'post_codeが半角の「3桁ハイフン4桁」でないと保存できない' do
        @order_address.post_code = '12-34567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code must be in the format of 3 digits hyphen 4 digits")
      end
      it 'prefectureを選択していないと保存できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefectureに「---」が選択されていると保存できない' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'tel_numberが空では保存できない' do
        @order_address.tel_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number can't be blank")
      end
      it 'tel_numberが9桁以下では保存できない' do
        @order_address.tel_number = '11111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number must be 10 to 11 digits")
      end
      it 'tel_numberが12桁以上では保存できない' do
        @order_address.tel_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number must be 10 to 11 digits")
      end
      it 'tel_numberが半角でないと保存できない' do
        @order_address.tel_number = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number must be 10 to 11 digits")
      end
    end

  end
end
