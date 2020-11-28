class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new,:create]

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
    @item = Item.find(params[:id])
  end
def edit
@item = Item.find(params[:id])
end

def destroy
  item = Item.find(parmas[:id])
  item.destroy
end
  private
  def item_params
    params.require(:item).permit( :name, :price, :description, :category_id, :condition_id, :cost_id, :area_id, :way_time_id, :image).merge(user_id: current_user.id)
  end

end
