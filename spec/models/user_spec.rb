require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname is invalid. Input half-width characters.")
    end
    it "emailが空では登録できない" do
      user = User.new(nickname: "222222", email: "", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank",
      "Email can't be blank",
      "Email is invalid",
      "Password is too long (maximum is 6 characters)")
    end
    it "passwordが空では登録できないこと" do
      user = User.new(nickname: "222222", email: "kkk@gmail.com", password: "", password_confirmation: "")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank", "Password can't be blank")
    end
    it "passwordが６文字以下の場合" do
      user = User.new(nickname: "222222", email: "dragonhorsepower@gmail.com", password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end
end
