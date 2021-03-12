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
- has_many :address

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name| string | null: false |
| desctiption  | integer | null: false |
| category   | string | null: false |
| condition   | string | null: false |
| shipping_area   | string | null: false |
| days_to_ship   | integer | null: false |
| user_id   | references | null: false,foreign_key: true |
| price   | integer | null: false |



### Association

- belongs_to :users
- has_one :buy

### addressesテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| users_address| string | null: false |
| user_id  | references | null: false,foreign_key: true |
| postal_code   | string | null: false |
| prefectures   | string | null: false |
| municipality   | string | null: false |
| address   | string | null: false |
| building_name   | string |  |
| phone_number   | string | null: false |


### Association

- belongs_to :users
- has_one :buys


### buysテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user_id| references | null: false, foreign_key: true |
| item_id  | integer | null: false |

### Association

- belongs_to :users
- belongs_to :items
