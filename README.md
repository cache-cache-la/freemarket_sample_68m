# データベース設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
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
- has_one :billing_information


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|text|text|null: false|
|stock|int|null: false|
|price|int|null: false|
|user_id|references|foreign_key: true|
|category_id|references|foreign_key: true|
|brand_id|references|foreign_key: true|
|status_id|references|foreign_key: true|

### Association
- has_many :images
- has_many :comments
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- belongs_to :status


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|picture|string|null: false|
|item_id|references|foreign_key: true|

### Association
- belongs_to :item


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
|ancestry|string||

### Association
- has_many :items
- has_ancestry


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items


## statusesテーブル
|Column|Type|Options|
|------|----|-------|
|condition|string|null: false|

### Association
- has_many :items


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string||
|prefectures|string||
|municipality|string||
|number|string||
|building|string||
|telephone_number|string||
|user_id|references|foreign_key: true|

### Association
- belongs_to :user


## Cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|customer_id|integer|null: false|
|card_id|integer|null: false|

### Association
- belongs_to :user