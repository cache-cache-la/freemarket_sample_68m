class Image < ApplicationRecord
  mount_uploader :picture, ImageUploader
  belongs_to :item

  has_one :purchase

end
