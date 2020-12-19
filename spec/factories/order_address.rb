FactoryBot.define do
  factory :order_address do
    token { "tok_0160429deb5f8b3e613a5e24e25e" }
    postal { "196-0015" }
    area { 2 }
    city { "昭島市" }
    address {"昭和町4-11-3"}
    building {"スクエアビル203"}
    phone { "08065669859" }

  end
end