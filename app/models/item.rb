class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :area
  belongs_to :shipping_time

  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :items_name, presence: true
  validates :description, presence: true
  validates :price, presence: true, format: {with: /\A[0-9]+\z/, message: 'Half-width number'}, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'Out of setting range'}
  validates :category_id, presence: true, numericality: { other_than: 1, message: 'Select' }
  validates :status_id, presence: true, numericality: { other_than: 1, message: 'Select' }
  validates :shipping_cost_id, presence: true, numericality: { other_than: 1, message: 'Select' }
  validates :area_id, presence: true, numericality: { other_than: 1, message: 'Select' }
  validates :shipping_time_id, presence: true, numericality: { other_than: 1, message: 'Select' }

  

end
