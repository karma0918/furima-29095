require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe "購入情報" do
    before do
      @order_address = FactoryBot.build(:order_address)
      
    end
    it "すべて書かれている場合実行できる" do
      expect(@order_address).to be_valid
    end

    it "郵便番号が空では実行できない" do
      @order_address.postal = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal can't be blank", "Postal is invalid")
    end
    it "都道府県が空では実行できない" do
      @order_address.area = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Area can't be blank", "Area is not a number")

    end
    it "市区町村が空では実行できない" do
      @order_address.address = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end
    it "建物名が空では実行できない" do
   
      @order_address.building = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Building can't be blank")
    end
  it "番地が空では実行できない" do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
  it "電話番号が空では実行できない" do
    @order_address.phone = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone can't be blank", "Phone is invalid")
    end
  end
end
