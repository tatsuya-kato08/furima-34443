require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '商品購入機能' do

    context '商品が購入できる場合' do
      it '必要な情報を適切に入力すると保存できる' do
        expect(@purchase_address).to be_valid
      end
    end

    context '商品が購入できない時' do

      it '郵便番号が空の場合は購入できない' do
        @purchase_address.code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Code can't be blank")
      end

      it '郵便番号にハイフンがない場合は購入できない' do
        @purchase_address.code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Code is invalid. Include hyphen(-)")
      end

      it '都道府県が未選択だと保存できない' do
        @purchase_address.area_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include
      end

      it '市区町村が空の場合は購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空の場合は購入できない' do
        @purchase_address.number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Number can't be blank")
      end

      it '電話番号が空の場合は購入できない' do
        @purchase_address.phone = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone can't be blank")
      end

      it '電話番号は11桁以内の数値のみ出ない場合は購入できない' do
        @purchase_address.phone = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
