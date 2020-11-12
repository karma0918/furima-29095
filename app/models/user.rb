class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname, format: { with: /\A[a-z0-9]+\z/i, message: 'is invalid. Input half-width characters.' }
    validates :password,length: { minimum: 1 }, presence: true,format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "数字と英語を含めては半角英数で入力してください。"}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角で入力してください'}
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角で入力してください'}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カナ'}
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カナ'}
    validates :birthday
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  end
  end

