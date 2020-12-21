class SessionsController < ApplicationController

  before_action :set_item, only: [:create,:index]

  def index

    unless user_signed_in?
      redirect_to new_user_registration_path
    end

    @order_address = OrderAddress.new
    if  current_user == @item.user
      redirect_to root_path
    end
    if @item.order.present?
      redirect_to root_path
    end

  end

   def create

     @order_address = OrderAddress.new(address_params)
     if @order_address.valid?
      pay_item
       @order_address.save
       redirect_to root_path
     else
       render template: "sessions/index"
    end
  end


  private

  def address_params
    
    params.require(:order_address).permit(:postal,:area,:city,:address,:building,:phone).merge(item_id: @item[:id],user_id: current_user.id,token: params[:token])
  end
  def set_item 
    @item = Item.find(params[:item_id])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: address_params[:token],
      currency: 'jpy'
    )
  end
end
