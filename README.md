# テーブル設計

## users テーブル
| Column             | Type       | Options                        |
| ------------------ | ------     | --------------------------     |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| birthday           | date       | null: false                    |
| nick_name          | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name_fgn      | string     | null: false                    |
| first_name_fgn     | string     | null: false                    |

### Association
- has_many :items
- has_many :orders

## items テーブル
| Column            | Type       | Options                        |
| -----------       | ---------- | ------------------------------ |
| item_name         | string     | null: false                    |
| category_id       | integer    | null: false                    |
| price             | integer    | null: false                    |
| content           | text       | null: false                    |
| condition_id      | integer    | null: false                    |
| delivery_charge_id| integer    | null: false                    |
| delivery_time_id  | integer    | null: false                    |
| prefecture_id     | integer    | null: false                    |
| user              | references | null: false  foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## orders テーブル
| Column        | Type       | Options                        |
| ----------    | ---------- | ------------------------------ | 
| user          | references | null: false  foreign_key: true |
| item          | references | null: false  foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one    :address

## addresses テーブル
| Column           | Type       | Options                        |
| ----------       | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| tel_number       | string     | null: false                    |
| building         | string     |                                |
| order            | references | null: false  foreign_key: true |

### Association
- belongs_to :order


