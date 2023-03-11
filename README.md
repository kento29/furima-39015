# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| user_birth_date_1i | integer | null: false |
| user_birth_date_2i | integer | null: false |
| user_birth_date_3i | integer | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                   | Type        | Options     |
| ------------------------ | ----------- | ----------- |
| item_name                | string      | null: false |
| item_info                | text        | null: false |
| item_category            | integer     | null: false |
| item_sales_status        | integer     | null: false |
| item_shipping_fee_status | integer     | null: false |
| item_prefecture          | integer     | null: false |
| item_scheduled_delivery  | integer     | null: false |
| item_price               | integer     | null: false |
| user                     | references  | null: false |

### Association

- has_one :orders
- belongs_to :users


## orders テーブル

| Column                   | Type        | Options     |
| ------------------------ | ----------- | ----------- |
| last_name                | string      | null: false |
| first_name               | string      | null: false |
| last_name_kana           | string      | null: false |
| first_name_kana          | string      | null: false |
| user                     | references  | null: false |
| item                     | references  | null: false |

### Association

- has_one :shipping_adds
- belongs_to :users
- belongs_to :items


## shipping_adds テーブル

| Column                   | Type       | Options     |
| ------------------------ | ---------- | ----------- |
| last_name                | string     | null: false |
| first_name               | string     | null: false |
| last_name_kana           | string     | null: false |
| first_name_kana          | string     | null: false |
| postal_code              | integer    | null: false |
| prefecture               | integer    | null: false |
| city                     | string     | null: false |
| addresses                | string     | null: false |
| building                 | string     | null: false |
| phone_number             | integer    | null: false |
| order                    | references | null: false |

### Association

- has_one :orders
