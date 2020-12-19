class SessionsController < ApplicationController
  def index
    if user_signed_in?
    end
    end
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new

  end

   def create
    @item = Item.find(params[:item_id])
     @order_address = OrderAddress.new(address_params)
     binding.pry
     if @order_address.valid?
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
end
