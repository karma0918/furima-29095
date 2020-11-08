class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :pssword,length: { maximum: 6 }, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
    validates :nickname, format: { with: /\A[a-z0-9]+\z/i, message: 'is invalid. Input half-width characters.' }

  end

end
