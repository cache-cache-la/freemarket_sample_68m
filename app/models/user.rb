class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

#   validates :nickname, presence: true

#   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
#   validates :email, format: {with: VALID_EMAIL_REGEX}, allow_blank: true
#   validates :email, presence: true

#   validates :encrypted_password, presence: true
#   validates :encrypted_password, length: { in: 6..128 }

#   validates :lastname, presence: true

#   validates :firstname, presence: true

#   validates :lastname_kana, presence: true

#   validates :firstname_kana, presence: true

#   validates :birthday, presence: true
end
