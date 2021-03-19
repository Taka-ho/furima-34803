# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email    | string | null: false,unique: true |
| encrypted_password | string | null: false |
| name_kanji_myouji|string  | null: false |
| name_kanji_namae|string  | null: false |
| name_katakana_myouji|string  | null: false |
| name_katakana_namae|string| null:false |
| nickname  | string | null:false |
| birth_day | date   | null:false |  
### Association

- has_many :items
- has_many :buys

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name| string | null: false |
| desctiption  | text | null: false |
| category_id   | integer | null: false |
| condition_id   | integer | null: false |
| shipping_charge_id | integer | null: false |
| shipping_area_id   | integer | null: false |
| days_to_ship_id   | integer | null: false |
| user   | references | null: false,foreign_key: true |
| price   | integer | null: false |



### Association

- belongs_to :user
- has_one :buy

### addressesテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| buy  | references | null: false,foreign_key: true |
| postal_code   | string | null: false |
| shipping_area_id   | integer | null: false |
| municipality   | string | null: false |
| address   | string | null: false |
| building_name   | string |  |
| phone_number   | string | null: false |


### Association

- belongs_to :user


### buysテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user| references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address
