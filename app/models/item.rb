class Item < ApplicationRecord
  has_many :images
  has_many :comments
  belongs_to :category
  belongs_to :brand
  belongs_to :status
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
end
