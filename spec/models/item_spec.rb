require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の登録' do
    context '商品が登録できる場合' do
      it 'すべての項目を正しく記入すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が登録できない場合' do
      it '商品画像が無ければ登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像を入力してください")
      end
      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品の説明が空では登録できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end
      it '価格が299以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は、¥300~¥9,999,999の間のみ保存可能")
      end
      it '価格が10,000,000以上では登録できない' do
        @item.price = '10,000,000'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は、¥300~¥9,999,999の間のみ保存可能")
      end
      it '価格が全角では登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は半角数値のみ保存可能")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
