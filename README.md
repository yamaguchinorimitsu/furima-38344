# テーブル設計

## users テーブル

| Column             | Type       | Options                   |
| ------------------ | ------     | --------------------------|
| email              | string     | null: false               |
| encrypted_password | string     | null: false               |
| name               | string     | null: false               |
| birth              | string     | null: false               |
| nick-name          | string     | null: false               |
| order              | references | null: false  foreign_key: true |
### Association

- has_many :items
- belongs_to :order



## items テーブル

| Column            | Type       | Options                        |
| -----------       | ---------- | ------------------------------ |
| item-name         | string     | null: false                    |
| category          | string     | null: false                    |
| price             | integer    | null: false                    |
| image             | text       | null: false                    |
| sales-commission  | integer    | null: false                    |
| profit            | integer    | null: false                    |
| content           | text       | null: false                    |
| condition         | text       | null: false                    |
| delivery-charge   | integer    | null: false                    |
| ship-from         | text       | null: false                    |
| user              | references | null: false  foreign_key: true |
| order             | references | null: false  foreign_key: true |
### Association

- belongs_to :user
- belongs_to :order



## orders テーブル

| Column        | Type       | Options                        |
| ----------    | ---------- | ------------------------------ |
| oders-name    | string     | null: false                    |
| oders-item    | string     | null: false                    |
| user          | references | null: false  foreign_key: true |
| address       | references | null: false  foreign_key: true |
### Association

- bas_many :items
- belongs_to :user
- belongs_to :address

## addresses テーブル

| Column           | Type       | Options                        |
| ----------       | ---------- | ------------------------------ |
| post-code        | string     | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| house-number     | string     | null: false                    |
| building         | string     | null: false                    |
| tel-number       | string     | null: false                    |
| card-number      | string     | null: false                    |
| order            | references | null: false  foreign_key: true |
### Association

- belongs_to :order


