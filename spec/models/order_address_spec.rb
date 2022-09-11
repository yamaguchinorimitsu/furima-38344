require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe 'ユーザー購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '購入できるとき' do
      it 'post_code, city, house_number, tell_number, prefecture_id, token が存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
      it '建物が空でも登録できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'post_codeが空では登録できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'tokenが空では登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeがハイフンなしでは登録できない' do
        @order_address.post_code = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'house_numberが空では登録できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'tell_numberが空では登録できない' do
        @order_address.tell_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tell number can't be blank")
      end

      it 'prefecture_idが空では登録できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'tell_numberが9文字以下では登録できない' do
        @order_address.tell_number = '111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tell number is invalid')
      end
      it 'tell_numberが12文字以上は登録できない' do
        @order_address.tell_number = '100000000001'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tell number is invalid')
      end
      it '電話番号が半角数字でなければ登録できない' do
        @order_address.tell_number = '９1111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tell number is invalid')
      end
      it '都道府県が「---」では登録できない' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'ユーザーが紐付いていないと出品は保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'アイテムが紐付いていないと出品は保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end  
    end
  end
end
