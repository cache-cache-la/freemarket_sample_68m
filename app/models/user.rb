class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :lastname_kana, presence: true
  validates :firstname_kana, presence: true
  validates :birthday, presence: true

  validates :nickname, length: { maximum: 10 }
  validates :lastname, length: { maximum: 10 }
  validates :firstname, length: { maximum: 10 }
  validates :lastname_kana, length: { maximum: 10 }
  validates :firstname_kana, length: { maximum: 10 }

  has_many :addresses

  #ニックネームにひらがな・カタカナ・漢字・半角英数を使えるように正規表現を設定
  VALID_NICKNAME_REGEX = /\A[ぁ-んァ-ン一-龥a-zA-Z0-9.!]/
  validates :nickname, uniqueness: true, format: { with: VALID_NICKNAME_REGEX}, on: :create

  #名字に漢字とひらがなを使えるように正規表現を設定
  VALID_LASTNAME_REGEX = /\A[一-龥ぁ-ん]/
  validates :lastname, format: { with: VALID_LASTNAME_REGEX}

  #名前に漢字とひらがなを使えるように名字から正規表現を参照している
  VALID_FIRSTNAME_REGEX = VALID_LASTNAME_REGEX
  validates :firstname, format: { with: VALID_FIRSTNAME_REGEX}

  #名字のフリガナにカタカナを使えるように正規表現を設定
  VALID_LASTNAMEKANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :lastname_kana, format: { with: VALID_LASTNAMEKANA_REGEX}

  #名前のフリガナにカタカナを使えるように名字のフリガナから正規表現を参照している
  VALID_FIRSTNAMEKANA_REGEX = VALID_LASTNAMEKANA_REGEX
  validates :firstname_kana, format: { with: VALID_FIRSTNAMEKANA_REGEX}

end
