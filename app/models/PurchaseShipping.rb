Class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :area_id, :city, :address, :building_name, :phone_number

  #バリデーションの記述

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(post_code :post_code, area_id :area_id, city :city, address :address, building_name :building_name, phone_number :phone_number)
  end
end
