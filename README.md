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

# users テーブル
| Column                    | Type   | Options                  |
| ------------------------- | ------ | ------------------------ |
| nick_name                 | string | null: false              |
| email                     | string | null: false unique: true |
| encrypted_password        | string | null: false              |
| first_name_kannji         | string | null: false              |
| second_name_kannji        | string | null: false              |
| first_name_kana           | string | null: false              |
| second_name_kana          | string | null: false              |
| date_birth                | date   | null: false              | # 生年月日

# アソシエーション
has_many: items
has_many: buyers

# items テーブル
| Column                | Type       | Options                       |
| --------------------- | ---------- | ----------------------------- |
| product_name          | string     | null: false                   | # 商品名
| discription           | text       | null: false                   | # 説明
| category_id           | integer    | null: false                   | # カテゴリー
| condition_id          | integer    | null: false                   | # 状態
| price                 | integer    | null: false                   | # 値段
| shipping_area_id      | integer    | null: false                   | # 都道府県
| shipping_day_id       | integer    | null: false                   | # 発送までの日数
| shipping_info_id      | integer    | null: false                   | # 配送料負担の情報
| user                  | references | null: false  foreign_key: true|

# アソシエーション
belongs_to: user
has_one: buyer


# buyers テーブル(購入管理)
| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| item              | references | null:false  |
| user              | references | null: false |

# アソシエーション
belongs_to: item
belongs_to: user
has_one: shipping_address

# shipping_addresses テーブル（配送先）

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| post_code          | string     | null: false                   | # 郵便番号
| shipping_area_id   | integer    | null: false                   | # 都道府県
| municipalities     | string     | null: false                   | # 市区町村
| address            | string     | null: false                   | # 番地
| building           | string     |                               | # 建物名
| telephone_number   | string     | null: false                   | # 電話番号
| buyer              | references | null: false foreign_key: true |

# アソシエーション
belongs_to: buyer
