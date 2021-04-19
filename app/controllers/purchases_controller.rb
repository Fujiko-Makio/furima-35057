class PurchasesController < ApplicationController

  def index
    @purchase = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new
  end


  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      @purchase_shipping.save
      redirect_to root_path
    else
      @purchase = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping).permit(:post_code, :area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
