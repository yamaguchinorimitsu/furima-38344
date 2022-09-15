require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規出品の保存' do
    context '新規出品が保存できる場合' do
      it 'item_name,category_id,price,content,condition_id,delivery_charge_id,delidery_time_id,prefecture_idが存在すれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '新規出品が保存できない場合' do
      it '商品画像が空では登録できない' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像は1枚以上5枚以下にしてください")
      end

      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it '商品の説明が空では登録できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("説明を入力してください")
      end

      it 'カテゴリーの情報が空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーが空なので登録できません")
      end

      it 'カテゴリーが「---」では登録できない' do
        @item.category_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーが空なので登録できません")
      end

      it '商品の状態が空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態が空なので登録できません")
      end

      it '商品の状態が「---」では登録できない' do
        @item.condition_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態が空なので登録できません")
      end

      it '配送元の地域が空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域が空なので登録できません")
      end

      it '配送元が「---」では登録できない' do
        @item.prefecture_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域が空なので登録できません")
      end

      it '配送料の負担が空では登録できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担が空なので登録できません")
      end

      it '配送料の負担が「---」では登録できない' do
        @item.delivery_charge_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担が空なので登録できません")
      end

      it '配送までの日数が空では登録できない' do
        @item.delivery_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送までの日数が空なので登録できません")
      end

      it '配送までの日数が「---」では登録できない' do
        @item.delivery_time_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("配送までの日数が空なので登録できません")
      end

      it '商品の価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("値段を入力してください")
      end

      it '商品の価格が半角数字でなければ登録できない' do
        @item.price = '９９９'
        @item.valid?
        expect(@item.errors.full_messages).to include('値段は数値で入力してください')
      end

      it '商品の価格が300円未満では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('値段は300以上の値にしてください')
      end

      it '商品の価格が10000000円以上は登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('値段は9999999以下の値にしてください')
      end

      it 'ユーザーが紐付いていないと出品は保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
