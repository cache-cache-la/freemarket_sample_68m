# データベース設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true, default: ""|
|password|string|null: false, default: ""|
|lastname|string|null: false|
|firstname|string|null: false|
|lastname_kana|string|null: false|
|firstname_kana|string|null: false|
|birthday|date|null: false|

### Association
- has_many :items
- has_many :addresses
- has_many :comments
- has_one :credit


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|name|string|null: false|
|text|string|null: false|
|shipping_method|string|null: false|
|stock|int|null: false|
||references|foreign_key: true|

### Association
- has_many :tag_maps
- has_many :tags, through: :tag_maps
- has_many :comments
- belongs_to :user
