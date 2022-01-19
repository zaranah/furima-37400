# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last-name          | string  | null: false               |
| first-name         | string  | null: false               |
| last-name-kana     | string  | null: false               |
| first-name-kana    | string  | null: false               |
| birth-date         | integer | null: false               |

### Association

- has_many :items
- has_many :orders
- has_many :shippings

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| info                | string     | null: false                    |
| category            | string     | null: false                    |
| sales-status        | string     | null: false                    |
| shipping-fee-status | string     | null: false                    |
| prefecture          | string     | null: false                    |
| scheduled-delivery  | integer    | null: false                    |
| price               | integer    | null: false                    |
| user_id             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :orders
- has_many :shippings

## orders テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |
| share_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :orders
- belongs_to :shippings

## shippings テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal-code  | integer    | null: false                    |
| prefecture   | references | null: false                    |
| city         | references | null: false                    |
| addresses    | references | null: false                    |
| building     | references | ---                            |
| phone-number | integer    | null: false                    |
| user_id      | references | null: false, foreign_key: true |
| item_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- has_many :orders