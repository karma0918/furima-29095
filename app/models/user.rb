class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname, format: { with: /\A[a-z0-9]+\z/i, message: 'is invalid. Input half-width characters.' }
    validates :password, presence: true, length: { maximum: 6 }, format: {with: /\A[a-zA-Z0-9]+\z/, message: "は半角英数で入力してください。"}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角で入力してください'}
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角で入力してください'}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カナ'}
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カナ'}
  end
  end

