# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

# user テーブル
| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nick_name          | string | null: false              |
| email              | string | null: false unique: true |
| encrypted_password | string | null: false              |
| first_name         | string | null: false              |
| second_name        | string | null: false              |
| date_birth         | string | null: false              | # 生年月日

# アソシエーション
has_many: items
has_many: buyer

# items テーブル
| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| product_name       | string     | null: false       | # 商品名
| image              | string     | null: false       | # 画像
| discription        | text       | null: false       | # 説明
| category           | string     | null: false       | # カテゴリー
| condition          | string     | null: false       | # 状態
| price              | string     | null: false       | # 値段
| shipping_area      | string     | null: false       | # 発送地域
| shipping_days      | string     | null: false       | # 発送までの日数
| user               | references | foreign_key: true |

# アソシエーション
belongs_to: user
belongs_to: buyer


# buyer テーブル
| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| credit             | string     | null: false                   | # クレジット
| post_code          | string     | null: false                   | # 郵便番号
| prefectures        | string     | null: false                   | # 都道府県
| municipalities     | string     | null: false                   | # 市区町村
| address            | string     | null: false                   | # 番地
| building           | string     |                               | # 建物名
| telephone_number   | string     | null: false                   | # 電話番号
| user               | references | null: false foreign_key: true |

# アソシエーション
belongs_to: items
belongs_to: user
