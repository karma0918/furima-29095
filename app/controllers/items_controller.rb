class ItemsController < ApplicationController
  def index
    
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    @item.valid?
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def item_params
    params.require(:item).permit( :name, :price, :description, :category_id, :condition_id, :cost_id, :area_id, :way_time_id, :image).merge(user_id: current_user.id)
  end

end
