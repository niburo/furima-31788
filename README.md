# テーブル設計

### users テーブル

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
 has_many   :  purchase


### addresses テーブル

| Column         | Type          | Options           |
| -------------- | ------------- | ----------------- |
| postal_code    | string        | null: false       |
| prefecture_id  | integer       | null: false       |
| municipality   | string        | null: false       |
| house_number   | string        | null: false       |
| building_name  | string        |                   |
| phone_number   | string        | null: false       |
| purchase       | references    | foreign_key: true |

### Association
 belongs_to : purchase



### items テーブル

| Column                   | Type          | Options         |
| ------------------------ | ------------- | --------------  |
| user                     | references    | foreign_key:true|
| name                     | string        | null: false     |
| info                     | text          | null: false     |
| category_id              | integer       | null: false     |
| sales_status_id          | integer       | null: false     |
| shipping_fee_status_id   | integer       | null: false     |
| prefecture_id            | integer       | null: false     |
| price                    | integer       | null: false     |
| scheduled_delivery_id    | integer       | null: false     |

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