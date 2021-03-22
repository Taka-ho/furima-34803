require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:form_order, user_id: @user.id, item_id: @item.id)
    sleep 2
  end

  describe '商品購入' do
    context '商品の購入ができるとき' do
      it 'すべてを入力したら保存できる' do
        expect(@order).to be_valid
      end
      it '建物名が抜けていても登録できること' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end

    context '商品の購入ができないとき' do
    it 'postal_codeが空の場合' do
      @order.postal_code = ''
      @order.valid?
      expect(@order.errors.full_messages).to include "Postal code can't be blank"
    end
    #値が空の場合のテスト
    it 'shipping_area_idが空では購入できない' do
      @order.shipping_area_id = ''
      @order.valid?
      expect(@order.errors.full_messages).to include "Shipping area can't be blank"
    end

    it 'municipalityが空だと購入できない' do
      @order.municipality = ''
      @order.valid?
      expect(@order.errors.full_messages).to include "Municipality can't be blank"
    end

    it 'addressが空では購入できない' do
      @order.address = ''
      @order.valid?
      expect(@order.errors.full_messages).to include "Address can't be blank"
    end

    it 'phone_number空だと場合は購入できない' do
      @order.phone_number = ''
      @order.valid?
      expect(@order.errors.full_messages).to include "Phone number can't be blank"
    end

    it 'user_idが空だと購入できない' do
      @order.user_id = ''
      @order.valid?
      expect(@order.errors.full_messages).to include "User can't be blank"
    end

    it 'item_id我からの場合購入できない' do
      @order.item_id = ''
      @order.valid?
      expect(@order.errors.full_messages).to include "Item can't be blank"
    end

        #値が空の場合のテスト(ここまで)

    #入力方法がおかしい場合のテスト

    it 'postal_codeが文字だと購入できない' do
      @order.postal_code = 'aaaaaaa'
      @order.valid?
      expect( @order.errors.full_messages).to include "Postal code is invalid"
    end

    it 'postal_codeが全角の数字だと購入できない' do
      @order.postal_code = '１１１１'
      @order.valid?
      expect(@order.errors.full_messages).to include "Postal code is invalid"

    end
    it 'postal_codeにハイフンがない場合は購入できない' do
      @order.postal_code = '1111111'
      @order.valid?
      expect(@order.errors.full_messages).to include "Postal code is invalid"

    end

    it 'phone_numberが数字だとできない' do
    @order.phone_number = 'aaaaaaa'
    @order.valid?
    expect( @order.errors.full_messages).to include "Phone number is invalid"
    end

    it 'phone_numberが全角だとできない' do
      @order.phone_number = '１２３４５６７８９１２３'
      @order.valid?
      expect( @order.errors.full_messages).to include "Phone number is invalid"
    end

    it 'phone_numberにハイフンが入っているとできない' do
      @order.phone_number = '123-4567-89123'
      @order.valid?
      expect( @order.errors.full_messages).to include "Phone number is invalid"
    end
end
end
end
