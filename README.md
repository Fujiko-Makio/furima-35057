## users テーブル

| Column          | Type   | Options     |
| ----------------| ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| name            | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |

### Association

- has_many :items
- has_many :items


## items テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| name       | string | null: false |
| price      | string | null: false |
| status     | string | null: false |
| category   | string | null: false |

### Association

- has_one :shippings
- has_one :purchases
- belongs_to :user


## purchases テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| total_amount | string     | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shippings



## shippings テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post_code    | string     | null: false                    |
| area         | string     | null: false                    |
| phone_number | string     | null: false                    |
| purchase     | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase