class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname, format: { with: /\A[a-z0-9]+\z/i, message: 'is invalid. Input half-width characters.' }
    validates :password, presence: true, length: { maximum: 6 }, format: {with: /\A[a-zA-Z0-9]+\z/, message: "は半角英数で入力してください。"}
  end
  end

