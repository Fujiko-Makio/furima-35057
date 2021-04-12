class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :move_to_signed_in, except: [:index]

  def index
    
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

  private
  def item_params
    params.require(:item).permit(:items_name, :image, :description, :price, :category_id, :status_id, :shipping_cost_id, :area_id, :shipping_time_id).merge(user_id: current_user.id)
  end
  
  def move_to_signed_in
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end

end
