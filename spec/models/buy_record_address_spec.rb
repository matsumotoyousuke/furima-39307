require 'rails_helper'

RSpec.describe BuyRecordAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_record_address = FactoryBot.build(:buy_record_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '商品購入できる場合' do
      it '必要事項を全て問題なく入力すると登録できる' do
        expect(@buy_record_address).to be_valid
      end

      it 'buildingは空でも購入できる' do
        @buy_record_address.building = nil
        expect(@buy_record_address).to be_valid
      end
    end

    context '商品購入できない場合' do
      it 'post_codeが空では購入できない' do
        @buy_record_address.post_code = ''
        @buy_record_address.valid?
        expect(@buy_record_address.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが「3桁ハイフン4桁」の半角文字列以外では購入できない' do
        @buy_record_address.post_code = '１１１１１１１'
        @buy_record_address.valid?
        expect(@buy_record_address.errors.full_messages).to include('Post code is invalid. Input correctly')
      end

      it 'prefecture_idが1では購入できない' do
        @buy_record_address.prefecture_id = '1'
        @buy_record_address.valid?
        expect(@buy_record_address.errors.full_messages).to include('Prefecture Select')
      end

      it 'municipalitiesが空では購入できない' do
        @buy_record_address.municipalities = ''
        @buy_record_address.valid?
        expect(@buy_record_address.errors.full_messages).to include("Municipalities can't be blank")
      end

      it 'street_addressが空では購入できない' do
        @buy_record_address.street_address = ''
        @buy_record_address.valid?
        expect(@buy_record_address.errors.full_messages).to include("Street address can't be blank")
      end

      it 'phone_numberが空では購入できない' do
        @buy_record_address.phone_number = ''
        @buy_record_address.valid?
        expect(@buy_record_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberは9桁以下では購入できない' do
        @buy_record_address.phone_number = '222222222'
        @buy_record_address.valid?
        expect(@buy_record_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberは12桁以上では購入できない' do
        @buy_record_address.phone_number = '222222222222'
        @buy_record_address.valid?
        expect(@buy_record_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberは半角数値のみでなければ購入できない' do
        @buy_record_address.phone_number = 'aaaaaaaaaaa'
        @buy_record_address.valid?
        expect(@buy_record_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'userが紐付いていないと保存できないこと' do
        @buy_record_address.user_id = nil
        @buy_record_address.valid?
        expect(@buy_record_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @buy_record_address.item_id = nil
        @buy_record_address.valid?
        expect(@buy_record_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では登録できないこと' do
        @buy_record_address.token = nil
        @buy_record_address.valid?
        expect(@buy_record_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
