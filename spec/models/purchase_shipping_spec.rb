require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @purchase_shipping = FactoryBot.build(:purchase_shipping, item_id: item.id, user_id: user.id)
  end

  context '商品の購入ができる時' do
    it '全ての情報が正しく入力できていれば購入できる' do
    expect(@purchase_shipping).to be_valid
    end
  end

  context '商品の購入ができない時' do
    it '郵便番号が空では購入できない' do
      @purchase_shipping.post_code = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Post code can't be blank")
    end

    it '郵便番号は半角ハイフンを入れた形式でないと購入できない' do
      @purchase_shipping.post_code = '1111111'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end

    it '郵便番号は数字以外では購入できない' do
      @purchase_shipping.post_code = 'ああああああ'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end

    it 'area_idが1では購入できない' do
      @purchase_shipping.area_id = 1
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Area must be other than 1")
    end

    it 'cityが空では購入できない' do
      @purchase_shipping.city = ""
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("City can't be blank")
    end

    it 'addressが空では購入できない' do
      @purchase_shipping.address = ""
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Address can't be blank")
    end

    it 'phone_numberが空では購入できない' do
      @purchase_shipping.phone_number = ""
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが全角数字では購入できない' do
      @purchase_shipping.phone_number = "８８８８８８８８８８８"
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Phone number is invalid")
    end

    it 'phone_numberが半角数字以外では購入できない' do
      @purchase_shipping.phone_number = "あ１ffdydh"
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Phone number is invalid")
    end

    it 'phone_numberが12桁以上では購入できない' do
      @purchase_shipping.phone_number = "1231234123412344"
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Phone number is invalid")
    end

    it 'tokenが空では購入できない' do
      @purchase_shipping.token = ""
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
    end

      it 'user_idが空では登録できない' do
        @purchase_shipping.user_id = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できない' do
        @purchase_shipping.item_id = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
      end

  end


end
