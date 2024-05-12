## users_テーブル

| Column             | Type    | Options                   |
| ------------------ | ------  | ------------------------- |
| nickname           | string  | null: false, unique: true |
| email              | string  | null: false               |
| family_name        | string  | null: false               |
| first_name         | string  | null: false               |
| family_name_kana   | string  | null: false               |
| first_name_kana    | string  | null: false               |
| encrypted_password | string  | null: false               |
| year_id            | integer | null: false               |
| month_id           | integer | null: false               |
| date_id            | integer | null: false               |

### Association

- has_many :orders
- has_many :items
- has_many :comments

## items_テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item_name          | string     | null: false                    |
| item_details       | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition__id      | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| area_id            | integer    | null: false                    |
| delivery_day_id    | integer    | null: false                    |
| price              | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order
- has_many :comments

## orders_テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one : address

## addresses_テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| order              | references | null: false, foreign_key: true |
| post_code          | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| building_name      | string     |                                |
| address            | string     | null: false                    |
| tel_number         | string     | null: false                    |

### Association

- belongs_to :order

## comments_テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
| comment            | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :item