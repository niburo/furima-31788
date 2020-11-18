class Purchase < ApplicationRecord
  belongs_to :item
  has_one    :addresse
  belongs_to :user
end
