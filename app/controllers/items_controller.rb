class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new,:create]
  before_action :set_item, only: [:show, :edit,:update]

  def index
    @items = Item.includes(:user).order("created_at ASC")
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

  end
 def edit
   if  current_user.id == @item.user_id 

   else
    render :index
   end
 end
 def update

  if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
  end
 end
 def destroy
   item = Item.find(parmas[:id])
   item.destroy
 end
  private
  def item_params
    params.require(:item).permit( :name, :price, :description, :category_id, :condition_id, :cost_id, :area_id, :way_time_id, :image).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end

end
