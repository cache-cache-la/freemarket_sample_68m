class Status < ApplicationRecord

  validates :condition, presence: true

  has_many :items
end
