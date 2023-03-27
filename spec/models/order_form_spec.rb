require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '配送先の入力' do
    context '購入が完了する場合' do
      it 'すべての項目を正しく記入すれば登録できる' do
        expect(@order_form).to be_valid
      end
    end

    context '購入が完了しない場合' do
      it '郵便番号が無ければ購入できない' do
        @order_form.postal_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみでなければ無ければ購入できない' do
        @order_form.postal_code = '1111111'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '都道府県が無ければ購入できない' do
        @order_form.prefecture_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が無ければ購入できない' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が無ければ購入できない' do
        @order_form.addresses = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Addresses can't be blank")
      end
      it '電話番号が無ければ購入できない' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は、10桁以上11桁以内の半角数値のみでなければ購入できない' do
        @order_form.phone_number = '090456789012'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number Please enter a half-width numerical value of 10 to 11 digits')
      end
      it 'tokenが空では登録できないこと' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
