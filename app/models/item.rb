class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :area
  belongs_to :shipping_time

  belongs_to :user
  has_one_attached :image

  validates :price, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :shipping_cost_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 1 }
  validates :shipping_time_id, numericality: { other_than: 1 }

end
