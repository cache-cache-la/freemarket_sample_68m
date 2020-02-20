class Categories < ActiveRecord::Base

  validates :name, presence: true

  has_many :items
  has_ancestry
end