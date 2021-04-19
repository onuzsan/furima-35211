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


#テーブル設計

## users テーブル

| Column             | Type        | Options                         |
| --------           | ----------- | ------------------------------- |
| nickname           | string      | null: false                     |
| email              | string      | null: false unique: true        |
| encrypted_password | string      | null: false                     |
| first_name         | string      | null: false                     |
| last_name          | string      | null: false                     |
| first_name_kana    | string      | null: false                     |
| last_name_kana     | string      | null: false                     |
| birthday           | date        | null: false                     |


### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column    | Type        | Options                         |
| --------  | ----------- | ------------------------------- |
| title     | string      | null: false                     |
|description| text        | null: false                     |
|category_id| string      | null: false                     |
|status_id  | integer     | null: false                     |
|shipping_id| integer     | null: false                     |
| area_id   | integer     | null: false                     |
| days_id   | integer     | null: false,                    |
| price     | integer     | null: false,                    |
| user      | references  | null: false, foreign_key: true  |



### Association

- belongs_to :user
- has_one    :buyer


## buyers テーブル

| Column      | Type        | Options                         |
| --------    | ----------- | ------------------------------- |
| user        | references  | null: false, foreign_key: true  |
| item        | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping
  
## shippings テーブル

| Column      | Type        |  Options                        |
| ----------- | ----------- | ------------------------------- |
| postal_code | string      | null: false                     |
| area_id     | integer     | null: false                     |
| municipality| string      | null: false                     |
| address     | string      | null: false                     |
| building    | string      |                                 |
| phone       | string      | null: false                     |
| user        | references  | null: false, foreign_key: true  |
| item        | references  | null: false, foreign_key: true  |

### Association

- belongs_to :buyer
- 