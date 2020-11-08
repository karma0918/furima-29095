# README

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| password           | string  | null: false |
| user_birth_date_1i | integer | null: false |
| user_birth_date_2i | integer | null: false |
| user_birth_date_3i | integer | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| first_name_kana    | string  | null: false |
| last_name_kana     | string  | null: false |

###Association

- has_many :items
- has_many :comments
- has_many :orders
- has_many :item, through: orders

## items

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| price       | string     | null: false                    |
| image       | string     | null: false                    |
| Description | text       | null: false                    |
| Category    | string     | null: false                    |
| Condition   | string     | null: false                    |
| costs       | string     | null: false                    |
| last_name   | string     | null: false                    |
| area        | string     | null: false                    |
| Time        | string     | null: false                    |
| user_id     | references | null: false, foreign_key: true |

###Association

- has_many :comments
- belongs_to :user
- has_one :orders

## comments

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

###Association

- belongs_to :user
- belongs_to :item

## orders

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal-code  | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| addresses    | string     | null: false                    |
| building     | string     | null: false                    |
| phone-number | integer    | null: false                    |
| item_id      | references | null: false, foreign_key: true |
| user_id      | references | null: false, foreign_key: true |

###Association

- belongs_to :user
- belongs_to :item
