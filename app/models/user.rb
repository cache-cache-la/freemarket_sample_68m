class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  VALID_NICKNAME_REGEX = /\A[ぁ-んァ-ン一-龥a-zA-Z0-9.!]/
  validates :nickname, presence: true, length: { maximum: 10 }, uniqueness: true, format: { with: VALID_NICKNAME_REGEX}, on: :create

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, on: :create, uniqueness: true, format: { with: VALID_EMAIL_REGEX}, allow_blank: true

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  puts '111111'.match?(VALID_PASSWORD_REGEX)
  validates :encrypted_password, presence: true, format: { with: VALID_PASSWORD_REGEX, message: "半角英数字で入力してください"}

  VALID_LASTNAME_REGEX = /\A[一-龥ぁ-ん]/
  validates :lastname, presence: true, length: { maximum: 10 }, format: { with: VALID_LASTNAME_REGEX}

  VALID_FIRSTNAME_REGEX = VALID_LASTNAME_REGEX
  validates :firstname, presence: true, length: { maximum: 10 }, format: { with: VALID_FIRSTNAME_REGEX}

  VALID_LASTNAMEKANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :lastname_kana, presence: true, length: { maximum: 10 }, format: { with: VALID_LASTNAMEKANA_REGEX}

  VALID_FIRSTNAMEKANA_REGEX = VALID_LASTNAMEKANA_REGEX
  validates :firstname_kana, presence: true, length: { maximum: 10 }, format: { with: VALID_FIRSTNAMEKANA_REGEX}

  validates :birthday, presence: true
end
