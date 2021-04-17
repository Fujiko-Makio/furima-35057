class PurchasesController < ApplicationController

  def index
    @purchase = Purchase.new
  end

  def create
    @purchase_shipping = PurchaseShippimgs.new(purchase_params)
    if @purchase_shipping.valid?
      @purchase_shipping.save
      return redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase_shippings).permit(:item_id, :post_code, :area_id, :city, :building_name, :phone_number)
  end

end
