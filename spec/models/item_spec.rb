require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/item-sample.png')
  end

  describe '商品出品機能' do
    context '商品が出品できる場合' do
      it '必要な情報を適切に入力すると保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it '商品画像がなければ保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名がなければ保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明がなければ保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが未選択だと保存できない' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it '商品状態が未選択だと保存できない' do
        @item.status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include
      end

      it '配送料負担が未選択だと保存できない' do
        @item.delivery_fee_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include
      end

      it '発送元地域が未選択だと保存できない' do
        @item.area_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include
      end

      it '発送までの日数が未選択だと保存できない' do
        @item.day_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include
      end

      it '販売価格の情報がないと保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格は、¥300~¥9,999,999以外は保存できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '販売価格は半角英数字以外は保存できない' do
        @item.price = '１２３'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
