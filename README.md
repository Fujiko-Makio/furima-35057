## users テーブル

| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| nickname           | string | null: false  |
| email              | string | unique: true |
| encrypted_password | string | null: false  |
| birthday           | date   | null: false  |
| first_name         | string | null: false  |
| last_name          | string | null: false  |
| first_name_kana    | string | null: false  |
| last_name_kana     | string | null: false  |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| items_name    | text       | null: false                    |
| description   | text       | null: false                    |
| price         | integer    | null: false                    |
| category      | integer    | null: false                    |
| status        | integer    | null: false                    |
| area          | integer    | null: false                    |
| shipping_cost | integer    | null: false                    |
| shipping_time | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user


## purchases テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping



## shippings テーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| post_code     | string      | null: false                    |
| area          | integer     | null: false                    |
| city          | string      | null: false                    |
| address       | string      | null: false                    |
| building_name | string      |                                |
| phone_number  | integer     | null: false                    |
| purchase      | references  | null: false, foreign_key: true |


### Association

- belongs_to :purchase