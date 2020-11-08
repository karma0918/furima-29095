require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname is invalid. Input half-width characters.")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank", "Email can't be blank", "Email is invalid")
    end
    it "passwordが空では登録できないこと" do
      @user.password = ""
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password can't be blank")
    end
    it "passwordが６文字以下の場合" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end
end
