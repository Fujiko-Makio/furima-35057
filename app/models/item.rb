class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :area
  belongs_to :shipping_time

  belongs_to :user
  has_one_attached :image
  has_many :purchases

  with_options presence: true do
    validates :image
    validates :items_name
    validates :description
  end

  validates :price, presence: true, format: {with: /\A[0-9]+\z/, message: 'Half-width number'}, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'Out of setting range'}

  with_options presence: true, numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :shipping_cost_id
    validates :area_id
    validates :shipping_time_id
  end

end
