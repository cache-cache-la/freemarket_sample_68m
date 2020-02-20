class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :lastname, :firstname, :lastname_kana, :firstname_kana, :birthday, presence: true

  #ニックネームにひらがな・カタカナ・漢字・半角英数を使えるように正規表現を設定
  VALID_NICKNAME_REGEX = /\A[ぁ-んァ-ン一-龥a-zA-Z0-9.!]/
  validates :nickname, presence: true, length: { maximum: 10 }, uniqueness: true, format: { with: VALID_NICKNAME_REGEX}, on: :create

  #名字に漢字とひらがなを使えるように正規表現を設定
  VALID_LASTNAME_REGEX = /\A[一-龥ぁ-ん]/
  validates :lastname, presence: true, length: { maximum: 10 }, format: { with: VALID_LASTNAME_REGEX}

  #名前に漢字とひらがなを使えるように名字から正規表現を参照している
  VALID_FIRSTNAME_REGEX = VALID_LASTNAME_REGEX
  validates :firstname, presence: true, length: { maximum: 10 }, format: { with: VALID_FIRSTNAME_REGEX}

  #名字のフリガナにカタカナを使えるように正規表現を設定
  VALID_LASTNAMEKANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :lastname_kana, presence: true, length: { maximum: 10 }, format: { with: VALID_LASTNAMEKANA_REGEX}

  #名前のフリガナにカタカナを使えるように名字のフリガナから正規表現を参照している
  VALID_FIRSTNAMEKANA_REGEX = VALID_LASTNAMEKANA_REGEX
  validates :firstname_kana, presence: true, length: { maximum: 10 }, format: { with: VALID_FIRSTNAMEKANA_REGEX}

  validates :birthday, presence: true

  #Userが買った商品
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"

  #Userが現在売っている商品
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"

  #Userが既に売った商品
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"
end
