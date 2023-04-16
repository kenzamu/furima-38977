## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association
has_many :items
has_many :orders

## items テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |  imageは、active_storageを使用
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| category_id        | integer    | null: false, foreign_key: true |  categoryからdelivery_dayは、active_hashを使用
| condition_id       | integer    | null: false, foreign_key: true |
| brand_id           | integer    | foreign_key: true              |
| postage_id         | integer    | null: false, foreign_key: true |  
| area_id            | integer    | null: false, foreign_key: true |
| delivery_day_id    | integer    | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :order
belongs_to :category    
belongs_to :condition        
belongs_to :brand     
belongs_to :postage          
belongs_to :area             
belongs_to :delivery_day

## orders テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :address

## address テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| prefecture_id      | integer    | null: false, foreign_key: true | active_hash
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association
belongs_to :order
belongs_to :prefecture




