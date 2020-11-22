require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/furima-footer.png')
  end

  it "imageがないと登録できない" do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank", "User must exist", "User must exist")
  end
  it "商品名がないと登録できない" do
    @item.name = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank", "User must exist", "User must exist")
  end
  it "商品の説明がないと登録できない" do
    @item.description = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Description can't be blank", "User must exist", "User must exist")
  end
  it "カテゴリーの情報がないと登録できない" do
    @item.category_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include("Category must be other than 0", "User must exist", "User must exist")
  end
  it "商品の状態がないと登録できない" do
    @item.condition_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition must be other than 0", "User must exist", "User must exist")
  end
  it "配送料の負担の情報がないと登録できない" do
    @item.cost_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include("Cost must be other than 0", "User must exist", "User must exist")
  end
  it "発送元の地域の情報がないと登録できない" do
    @item.area_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include("Area must be other than 0", "User must exist", "User must exist")
  end
  it "発送までの日数の情報がないと登録できない" do
    @item.way_time_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include("Way time must be other than 0", "User must exist", "User must exist")
  end
  it "価格についての情報がないと登録できない" do
    @item.price = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not included in the list", "Price 半角数字で入力", "User must exist", "User must exist")
  end
  it "価格が３００円以下では登録できない" do
    @item.price = 200
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not included in the list", "User must exist", "User must exist")
  end
  it "価格が９９９９９９９円以上では登録できないこと" do
    @item.price = 10000000
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not included in the list", "User must exist")
  end
  it "販売価格は半角数字のみ保存可能" do
    @item.price = '９０００'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not included in the list", "User must exist")
  end


end
