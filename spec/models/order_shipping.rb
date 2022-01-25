require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
    sleep 0.9
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'postal_code, prefecture_id, city, addresses, building, phone_number, tokenが存在すれば登録できる' do
        expect(@order_shipping).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_shipping.building = ''
        expect(@order_shipping).to be_valid
      end
    end
    context '商品購入できないとき' do
      it 'postal_codeが空では登録できない' do
        @order_shipping.postal_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("郵便番号を入力してください", "郵便番号は３桁、ハイフン、４桁の形で入力してください")
      end
      it 'postal_codeがハイフンがなければ登録できない' do
        @order_shipping.postal_code = '1111111'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("郵便番号は３桁、ハイフン、４桁の形で入力してください")
      end
      it 'postal_codeが全角では登録できない' do
        @order_shipping.postal_code = '５００ー００００'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("郵便番号は３桁、ハイフン、４桁の形で入力してください")
      end
      it 'prefectureが空では登録できない' do
        @order_shipping.prefecture_id = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'prefectureの未選択項目を選ぶと登録できない' do
        @order_shipping.prefecture_id = '1'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'cityが空では登録できない' do
        @order_shipping.city = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'addressesが空では登録できない' do
        @order_shipping.addresses = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空では登録できない' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("電話番号を入力してください", "電話番号は数値で入力してください", "電話番号は10桁か11桁で入力してください")
      end
      it 'phone_numberが全角では登録できない' do
        @order_shipping.phone_number = '０００１１１１２２２２'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("電話番号は数値で入力してください", "電話番号は10桁か11桁で入力してください")
      end
      it 'phone_numberが9桁以下では登録できない' do
        @order_shipping.phone_number = '123456789'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("電話番号は10桁か11桁で入力してください")
      end
      it 'phone_numberが12桁以上では登録できない' do
        @order_shipping.phone_number = '123451234512'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("電話番号は10桁か11桁で入力してください")
      end
      it 'tokenが空では登録できない' do
        @order_shipping.token = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'userが紐付いていなければ出品できない' do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Userを入力してください")
      end
      it 'userが紐付いていなければ出品できない' do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end