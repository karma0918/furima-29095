class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new,:create]
  before_action :set_item, only: [:show, :edit,:update,:destroy]
  before_action :mine, only: [:edit,:destroy]

  def index
    @items = Item.includes(:user).order("created_at ASC")
    @order = Order.new
  end
  def new

    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
    @order = Order.new
    
  end
 def edit

 end
 def update

  if @item.update(item_params)
      redirect_to root_path
  else
      render :edit
  end
 end
 def destroy

   if @item.destroy
    redirect_to root_path 
   else
    render :show
   end

 end
  private
  def item_params
    params.require(:item).permit( :name, :price, :description, :category_id, :condition_id, :cost_id, :area_id, :way_time_id, :image).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])

  end
  def mine
    unless current_user.id == @item.user_id
      render :index
    end
  end

end
