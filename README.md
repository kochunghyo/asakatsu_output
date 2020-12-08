# README
## usersテーブル
|Column|Type|options|
|------|----|-------|
|nickname|string|null:false|
|email|string|null:false,unique:true|
|password|string|null:false|
|password_confirmation|string|null:false|
|first_name|string|null:false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|birthday|date|null:false|
|face_image|string|

### Association
- has_many :outputs
- has_many :comments
- has_many :likes
- mount_uploader :face_image, ImageUploader
- has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
- has_many :following, through: :following_relationships
- has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
- has_many :followers, through: :follower_relationships

## outputsテーブル
|Column|Type|options|
|------|----|-------|
|title|string|null:false|
|text|string|null:false|
|type_id|bigint|null:false,foreign_key:true|
|user_id|bigint|null:false,foreign_key:true|

### Association
- has_many :images, dependent: :destroy
- accepts_nested_attributes_for :images, allow_destroy: true
- belongs_to :user
- belongs_to_active_hash :type
- has_many :comments
- has_many :likes

## imagesテーブル
|Column|Type|options|
|------|----|-------|
|src|string|null:false|
|output|references|null:false,foreign_key:true|

### Association
- mount_uploader :src, ImageUploader
- belongs_to :output

## commentsテーブル
|Column|Type|options|
|------|----|-------|
|user_id|integer|
|output_id|integer|
|text|text|

### Association
- belongs_to :output
- belongs_to :user

## likesテーブル
|Column|Type|options|
|------|----|-------|
|user|references|null:false,foreign_key:true|
|output|references|null:false,foreign_key:true|

### Association
- belongs_to :output
- belongs_to :user

## relationshipsテーブル
|Column|Type|options|
|------|----|-------|
|follower_id|integer|foreign_key: {to_table: :users}|
|following_id|integer|foreign_key: {to_table: :users}|
|follower_id|index|unique:true|
|following_id|index|unique:true|

### Association
- belongs_to :following, class_name: "User"
- belongs_to :follower, class_name: "User"
