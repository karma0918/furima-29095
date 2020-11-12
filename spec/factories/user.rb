FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email { 'dragonhorsepower@gmail.com' }
    password { 'karma1234' }
    password_confirmation { password }
    first_name { '山田' }
    last_name { '太郎' }
    first_name_kana { 'ヤマダ' }
    last_name_kana { 'タロウ' }
    birthday {'2002-07-04'}
  end
end
