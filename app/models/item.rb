class Item < ApplicationRecord
  # 商品が削除された際に画像も一緒に削除されるようにするため
  has_many :images,dependent: :destroy
  # imageをitemにネストさせる表記
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :comments
  has_one :purchase
  belongs_to :category
  belongs_to :brand
  belongs_to :status
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
end
