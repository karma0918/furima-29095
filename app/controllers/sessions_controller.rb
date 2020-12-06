class SessionsController < ApplicationController
  def index
    @item = Item.find(params[:id])
  end
  def new
    
  end
  def create
    
  end
end
