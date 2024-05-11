## users_テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| encrypted_password | string | null: false |
| birthday           | date   | null: false |

## items_テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item_name          | string     | null: false                    |
| item_details       | text       | null: false                    |
| category           | tring      | null: false                    |
| condition          | tring      | null: false                    |
| delivery_charge    | tring      | null: false                    |
| area               | tring      | null: false                    |
| delivery_day       | tring      | null: false                    |
| price              | integer    | null: false                    |

## oders_テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

## adresses_テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| post_code          | string     | null: false                    |
| adress             | text       | null: false                    |
| tel_number         | string     | null: false                    |

## comments_テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
| comment            | text       | null: false                    |