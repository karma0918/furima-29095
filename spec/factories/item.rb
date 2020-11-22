FactoryBot.define do
  factory :item do
    name { "karma" }
    price { 3000 }
    description { "testtesttest" }
    category_id { 2 }
    condition_id { 2 }
    cost_id { 2 }
    area_id { 2 }
    way_time_id { 2 }
    association :user 
  end
end