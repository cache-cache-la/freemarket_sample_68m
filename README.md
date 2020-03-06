FURIMASample68m
====
<br>
# Overview
商品の出品、編集、購入が行えるフリマアプリとなります。

# Description
以下の機能を実装しています。
* ユーザー新規登録/ログイン
  * 登録はウィザード形式を採用
* マイページ
  * ログアウト
  * クレジットカード登録
* 商品出品
  * 複数画像投稿
  * 親、子、孫カテゴリーや商品状態の選択
  * 出品者は編集、削除も可能
* 商品購入
  * カード登録が行われていなければ、マイページに移動出来るリンクあり
  * ログアウトした状態で購入ボタンを押すとログインページに遷移
  * 購入された商品のボタンは"購入できません"に変わる
* ページ共通
  * 右下の出品ボタン固定
  * アクションバーにユーザーの位置が分かるパンくず
  * アクションバーにあるカテゴリーのドロップダウンメニュー

# Demo
## マイページ
https://gyazo.com/39cefff3ea6f0fc1eebd557ed430b239

## 出品
https://gyazo.com/7ac9a40bccf9b27c457305e4ae8d0cd1

# Usage
* テストアカウントでログイン
  * トップページを始めとした各ページから出品ボタン押下→商品情報入力→商品出品
  * トップページの新規商品一覧→商品選択→商品購入

# Issue
## URL
http://52.197.205.247/

## Basic authentication
ID：admin  
Pass：2222  

## Test account
* 購入者用
メールアドレス：test@test.com  
パスワード：test123  

* 購入用カード情報
番号：4242424242424242  
期限：月/年（現在より先であれば可）  
セキュリティカード：123（三桁であれば可）  

* 出品者用
メールアドレス：seller@seller.com  
パスワード：seller123  

<br>

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


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|text|text|null: false|
|price|integer|null: false|
|category_id|references|foreign_key: true|
|brand_id|references|foreign_key: true|
|status_id|references|foreign_key: true|
|seller_id|integer||
|buyer_id|integer||

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
- has_one :purchase


## Cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user
- has_one :purchase

## Purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|address_id|references|foreign_key: true|
|card_id|references|foreign_key: true|


### Association
- belongs_to :address
- belongs_to :card