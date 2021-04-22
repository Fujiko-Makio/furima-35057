class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase, only: [:index, :create]
  before_action :move_to_index

  def index
    @purchase_shipping = PurchaseShipping.new
  end


  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end



  private

  def set_purchase
    @purchase = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_shipping).permit(:post_code, :area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @purchase.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if @purchase.purchase.present? or current_user == @purchase.user
      redirect_to root_path 
    end
  end

end
