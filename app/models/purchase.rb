class Purchase < ApplicationRecord
  belongs_to :address
  belongs_to :card
end
