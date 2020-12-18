class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal, :area, :city, :address, :building, :phone,:item_id,:user_id,:token

    with_options presence: true do
       validates :token
       validates :area, numericality: { other_than: 0}
       validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/, messages:'ハイフン込の半角で入力してください'}
       validates :city
       validates :address
       validates :building
       validates :phone, format: { with: /\A[0-9]+\z/, messages: '半角数字で入力してください'}
    end

    
    def save
      order = Order.create(user_id: user_id, item_id:item_id)

      Address.create(postal: postal, area: area, city: city, address: address, building: building, phone: phone,order_id: order)
      binding.pry
    end
  
end