class Image < ApplicationRecord
  mount_uploader :picture, ImageUploader
  belongs_to :item

  validates :picture, presence: true

end
