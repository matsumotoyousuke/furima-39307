require 'rails_helper'

RSpec.describe BuyRecordAddress, type: :model do
  before do
    @buy_record_address = FactoryBot.build(:buy_record_address)
  end

  describe '商品購入' do
    context '商品購入できる場合' do
      it '必要事項を全て問題なく入力すると登録できる' do
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

      it 'prefecture_idが空では購入できない' do
        @buy_record_address.prefecture_id = ''
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
        expect(@buy_record_address.errors.full_messages).to include("Phone number can't be blank",
                                                                    'Phone number Input only number')
      end

      it 'phone_numberが10桁以上11桁以内の半角数値以外では購入できない' do
        @buy_record_address.phone_number = '22222222'
        @buy_record_address.valid?
        expect(@buy_record_address.errors.full_messages).to include('Phone number Input only number')
      end

      it 'userが紐付いていないと保存できないこと' do
        @buy_record_address.user_id = ''
        @buy_record_address.valid?
        expect(@buy_record_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @buy_record_address.item_id = ''
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
