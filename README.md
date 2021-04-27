## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| birthday           | date   | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |

### Association

- has_many :items
- has_many :purchases
- has_many :messages


## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| items_name       | string     | null: false                    |
| description      | text       | null: false                    |
| price            | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| area_id          | integer    | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| shipping_time_id | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user
- has_many :messages


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
| area_id       | integer     | null: false                    |
| city          | string      | null: false                    |
| address       | string      | null: false                    |
| building_name | string      |                                |
| phone_number  | string      | null: false                    |
| purchase      | references  | null: false, foreign_key: true |


### Association

- belongs_to :purchase


## messages テーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| text          | text        | null: false                    |
| item          | references  | null: false, foreign_key: true |
| user          | references  | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user