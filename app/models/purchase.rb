class Purchase < ApplicationRecord
  validates :price, presence: true
  belongs_to :item
  has_one    :addresse
  belongs_to :user
end
