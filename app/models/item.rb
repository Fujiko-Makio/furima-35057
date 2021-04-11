class Item < ApplicationRecord
  belongs_to :user
  has_one_attched :purchase
end
