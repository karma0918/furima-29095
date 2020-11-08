FactoryBot.define do
  factory :user do
    nickname {"test"}
    email {"dragonhorsepower@gmail.com"}
    password {"000000"}
    password_confirmation {password}
  end
end