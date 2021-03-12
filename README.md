# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email    | string | unique: true |
| encrypted_password | string | null: false |
| name_kanji_myouji|string  | null: false |
| name_kanji_namae|string  | null: false |
| name_katakana_myouji|string  | null: false |
| name_katakana_namae|string| null:false |
| nickname  | string | null:false |
| birth_day | date   | null:false |  
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

### address

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| users_address| string | null: false |
| user_id  | integer | null: false |
| postal_code   | string | null: false |
| prefectures   | string | null: false |
| municipality   | string | null: false |
| address   | string | null: false |
| building_name   | string | null: false |
| phone_number   | string | null: false |

### buys

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user_id| integer | null: false |
| item_id  | integer | null: false |