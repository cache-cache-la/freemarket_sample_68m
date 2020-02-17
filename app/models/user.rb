class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  VALID_NICKNAME_REGEX = /\A[ぁ-んァ-ン一-龥a-zA-Z0-9.!]/
  validates :nickname,
    presence: true,
    uniqueness: true,
    length: { maximum: 10 },
    format: { with: VALID_NICKNAME_REGEX},
    allow_blank: true,
    on: :create

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
    presence: true,
    uniqueness: true
    format: { with: VALID_EMAIL_REGEX},
    allow_blank: true,
    on: :create

  VALID_PASSWORD_REGEX = /\A[0-9]+\z/
  validates :encrypted_password,
    presence: true,
    length: { in: 6..128 },
    numericality: true,
    format: { with: VALID_PASSWORD_REGEX},
    allow_blank: true,
    on: :create

  VALID_LASTNAME_REGEX = /\A[一-龥ぁ-ん]/
  validates :lastname,
    presence: true,
    length: { maximum: 10 },
    format: { with: VALID_LASTNAME_REGEX},
    allow_blank: true,
    on: :create

  VALID_FIRSTNAME_REGEX = VALID_LASTNAME_REGEX
  validates :firstname,
    presence: true,
    length: { maximum: 10 },
    format: { with: VALID_FIRSTNAME_REGEX},
    allow_blank: true,
    on: :create

  VALID_LASTNAMEKANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :lastname_kana,
    presence: true,
    length: { maximum: 10 },
    format: { with: VALID_LASTNAMEKANA_REGEX},
    allow_blank: true,
    on: :create

  VALID_FIRSTNAMEKANA_REGEX = VALID_LASTNAMEKANA_REGEX
  validates :firstname_kana,
    presence: true,
    length: { maximum: 10 },
    format: { with: VALID_FIRSTNAMEKANA_REGEX},
    allow_blank: true,
    on: :create

  validates :birthday,
    presence: true,
    allow_blank: true,
    on: :create
end
