class Purchase < ApplicationRecord
  belongs_to :address
  belongs_to :card
  belongs_to :item
  belongs_to :user
end
