# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false , foreign_key: true|
| email    | string | null: false |
| password | string | null: false |
| name(漢字)|string  | null: false |
| name(カタカナ)|string| null:false |
| nickname  | string | null:false |
| birth_day | integer | null:false |  
### Association

- has_many :items
- has_one :address

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| items_name| string | null: false |
| items_desctiption  | integer | null: false |
| category   | string | null: false |
| condition   | string | null: false |
| shipping_area   | string | null: false |


### Association

- belongs_to :users, foreign_key: true
- has_one :buy
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user_id| references | null: false, foreign_key: true |
| item_id| references | null: false, foreign_key: true |

### Association

- has_one :address
- has_one :items

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user