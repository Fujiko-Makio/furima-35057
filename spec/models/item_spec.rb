require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do

    context '出品できる時' do

      it '全ての情報を正しく入力できていれば保存できる' do
        expect(@item).to be_valid
      end

      it '販売価格は半角数字のみ保存できる' do
        @item.price = "33333"
        expect(@item).to be_valid
      end

    
    end

    context '出品できない時' do

      it '画像がなければ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では保存できない' do
        @item.items_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Items name can't be blank")
      end

      it '商品の説明が空では出品できない' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーの情報が空では出品できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category Select")
      end

      it '商品の状態の情報が空では出品できない' do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", "Status Select")
      end

      it '発送元の地域の情報が空では出品できない' do
        @item.area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank", "Area Select")
      end

      it '配送料の負担についての情報が空では出品できない' do
        @item.shipping_cost_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank", "Shipping cost Select")
      end

      it '発送までの日数についての情報が空では出品できない' do
        @item.shipping_time_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping time can't be blank", "Shipping time Select")
      end

      it '販売価格の情報が空では出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price Half-width number")
      end

      it '販売価格が¥300未満では保存できない' do
        @item.price = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it '販売価格が¥9,999,999以上では保存できない' do
        @item.price = "99999999"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it '販売価格は全角数字では保存できない' do
        @item.price = "４４４４４"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
    end


  end

end
