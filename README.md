# テーブル設計

## users テーブル

|      Column        |  Type  |   Options   |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name.kana     | string | null: false |
| first_name.kana    | string | null: false |
| birthday           | date   | null: false |


### Association
 has_many   :  items
 has_many   :  addresses
 has_one    :  purchase


### address テーブル

| Column        | Type          | Options           |
| ------------- | ------------- | ----------------- |
| user          | string        | null: false       |
| postal_code   | string        | null: false       |
| prefectures   | integer       | null: false       |
| municipality  | string        | null: false       |
| house_number  | string        | null: false       |
| building_name | string        | foreign_key: true |
| phone_number  | string        | null: false       |
| purchases     | references    | foreign_key: true |

### Association
 belongs_to : purchase



### items テーブル

| Column                   | Type          | Options         |
| ------------------------ | ------------- | --------------  |
| image                    | ActiveStorage | null: false     |
| user                     | references    | foreign_key:true|
| name                     | string        | null: false     |
| info                     | integer       | null: false     |
| category                 | integer       | null: false     |
| sales_status             | integer       | null: false     |
| shipping_fee_status      | integer       | null: false     |
| prefecture               | integer       | null: false     |
| price                    | integer       | null: false     |
| scheduled_delivery       | integer       | null: false     |

### Association
 belongs_to :  user
 has_one    :  purchase



### purchases テーブル

| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| user      | references | foreign_key: true |
| item      | references | foreign_key: true |



### Association
 belongs_to :  item
 has_one    :  address
 belongs_to :  user