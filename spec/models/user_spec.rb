require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Nickname is invalid. Input half-width characters.')
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank", "Email can't be blank", 'Email is invalid')
    end
    it 'emailに＠が含まれていない場合登録できない' do
      @user.email = 'dragonhorsepowergmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid", "Email is invalid")
    end
    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password can't be blank")
    end
    it 'passwordが６文字以下の場合' do
      @user.password = '00kar'
      @user.password_confirmation = '00kar'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordに英語を含めなければならない' do
      @user.password = '00000000'
      @user.password_confirmation = '00000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 数字と英語を含めては半角英数で入力してください。")
    end
    

    it 'first_nameが空の場合登録できない' do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name 全角で入力してください")
    end
    it 'last_nameが空の場合登録できない' do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name 全角で入力してください")
    end
    it 'first_name_kanaが空の場合登録できない' do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana 全角カナ")
    end
    it 'last_name_kanaが空の場合登録できない' do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana 全角カナ")
    end
    it 'birthdayが空の場合登録できない' do
      @user.last_name = ""
      @user.valid?   
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name 全角で入力してください")
    end
    it 'first_nameは全角でないと登録できない' do
      @user.first_name = "karama"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角で入力してください")
    end
    it 'last_nameは全角でないと登録できない' do
      @user.last_name = "karma"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角で入力してください")
    end
    it 'first_name_kana全角カナでないと登録できない' do
      @user.first_name_kana = 'ka45'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カナ")
    end
    it 'last_name_kana全角カナでないと登録できない' do
      @user.last_name_kana = "かるま"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角カナ")
    end
    it 'passowrdが６文字以上である必要がある' do
    @user.password = "karma"
    @user.password_confirmation = "karma"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'emailは重複してはいけない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
  end
end
