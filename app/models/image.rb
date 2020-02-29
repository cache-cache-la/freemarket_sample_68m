class Image < ApplicationRecord
  mount_uploader :picture, ImageUploader
  belongs_to :item


  validates_associated :item


  has_one :purchase

end
