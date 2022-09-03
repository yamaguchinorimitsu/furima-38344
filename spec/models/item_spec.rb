require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規出品の保存' do
    context "新規出品が保存できる場合" do
      it "item_name,category_id,price,content,condition_id,delivery_charge_id,delidery_time_id,prefecture_idが存在すれば保存できる" do
        expect(@item).to be_valid
      end
    
    end
    
    context "新規出品が保存できない場合" do
      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      
      it '商品の説明が空では登録できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end

      it 'カテゴリーの情報が空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      
      it '商品の状態が空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      
      it '配送元の地域が空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      
      it '配送料の負担が空では登録できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      
      it '配送までの日数が空では登録できない' do
        @item.delivery_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end
      
      it '商品の価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '商品の価格が半角数字でなければ登録できない' do
        @item.price = '９９９'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      
      
      
      it "ユーザーが紐付いていないと出品は保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      

    end
  end

end


