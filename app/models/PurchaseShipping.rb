Class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :area_id, :city, :address, :building_name, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :area_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, format: { /\A\d{11}\z/ }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(post_code :post_code, area_id :area_id, city :city, address :address, building_name :building_name, phone_number :phone_number)
  end
end
