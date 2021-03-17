require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品の出品ができるとき' do
      it 'すべてを入力したら保存できる' do
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができないとき' do
    it 'nameが空の場合' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end
    it 'desctiptionが空では出品できない' do
      @item.desctiption = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Desctiption can't be blank"
    end

    it 'category_idが空だと出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Category must be other than 1"
    end

    it 'condition_idが空では出品できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Condition must be other than 1"
    end

    it 'shipping_charges_id空では出品できない' do
      @item.shipping_charges_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping charges must be other than 1"
    end

    it 'shipping_area_id空だと場合は出品できない' do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping area must be other than 1"
    end

    it 'days_to_ship_idが空の場合は出品できない' do
      @item.days_to_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Days to ship must be other than 1"
    end

    it 'priceが空の場合は出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank", "Price is invalid", "Price is not a number"
    end

    it 'priceが文字だと出品できない' do
      @item.price = 'aaaaaaa'
      @item.valid?
      expect( @item.errors.full_messages).to include "Price is not a number"
    end

    it 'priceが全角の数字だと出品できない' do
      @item.price = '１１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"

    end

    it '商品価格が299円以下では出品できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"

    end

    it '商品価格が10_000_000円以上では出品できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"

    end

    it 'imageがない場合は出品ができない' do
     @item.image = nil
     @item.valid?
     expect(@item.errors.full_messages).to include "Image can't be blank"
  end
end
end
end