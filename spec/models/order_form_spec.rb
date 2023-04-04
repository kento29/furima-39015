require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end

  describe '購入情報の保存' do
    context '購入が完了する場合' do
      it 'すべての項目を正しく記入すれば購入できる' do
        expect(@order_form).to be_valid
      end
      it '建物名が空でも購入できる' do
        @order_form.building_name = nil
        expect(@order_form).to be_valid
      end
    end
  end

  context '購入が完了しない場合' do
    it '郵便番号が無ければ購入できない' do
      @order_form.postal_code = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("郵便番号を入力してください")
    end
    it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみでなければ無ければ購入できない' do
      @order_form.postal_code = '1111111'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("郵便番号は「3桁ハイフン4桁」の半角文字列で入力してください")
    end
    it '都道府県に『---』が選択されている場合には購入できない' do
      @order_form.prefecture_id = 1
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("都道府県を選択してください")
    end
    it '市区町村が無ければ購入できない' do
      @order_form.city = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("市区町村を入力してください")
    end
    it '番地が無ければ購入できない' do
      @order_form.addresses = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("番地を入力してください")
    end
    it '電話番号が無ければ購入できない' do
      @order_form.phone_number = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("電話番号を入力してください")
    end
    it '電話番号は、10桁以上11桁以内の半角数値のみでなければ購入できない' do
      @order_form.phone_number = '０9000000000'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("電話番号は10桁以上11桁以内の半角数字で入力してください")
    end
    it '電話番号は、9桁以下では購入できない' do
      @order_form.phone_number = '090456789'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("電話番号は10桁以上11桁以内の半角数字で入力してください")
    end
    it '電話番号は、12桁以上では購入できない' do
      @order_form.phone_number = '090456789012'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("電話番号は10桁以上11桁以内の半角数字で入力してください")
    end
    it 'tokenが空では購入できない' do
      @order_form.token = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("クレジットカード情報が正しくありません")
    end
    it 'ユーザーが紐付いていなければ購入できない' do
      @order_form.user_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("ユーザーIDが存在しません")
    end
    it '商品が紐付いていなければ購入できない' do
      @order_form.item_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("商品IDが存在しません")
    end
  end
end
