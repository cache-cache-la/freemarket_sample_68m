class Item < ApplicationRecord

  validates :name, :text, :price, presence: true
  
  
  has_many :images
  accepts_nested_attributes_for :images

  has_many :comments

  belongs_to :category

  belongs_to :brand

  belongs_to :status

  belongs_to :seller, class_name: "User"

  belongs_to :buyer, class_name: "User"
end