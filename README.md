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
| email              | string      | unique: true                    |
| encrypted_password | string      | null: false                     |
| first_name         | string      | null: false                     |
| last_name          | string      | null: false                     |
| first_name_kana    | string      | null: false                     |
| last_name_kana     | string      | null: false                     |
| birthday           | date        | null: false                     |


### Association

- has_many :items
- has_one  :buyer

## items テーブル

| Column    | Type        | Options                         |
| --------  | ----------- | ------------------------------- |
| title     | string      | null: false                     |
|description| text        | null: false                     |
| category  | string      | null: false                     |
|status-id  | integer     | null: false                     |
|shipping-id| integer     | null: false                     |
| area-id   | integer     | null: false                     |
| days-id   | integer     | null: false,                    |
| price     | integer     | null: false,                    |
| user      | references  | null: false, foreign_key: true  |



### Association

- belongs_to :user
- belongs_to :buyer


## buyers テーブル

| Column      | Type        | Options                         |
| --------    | ----------- | ------------------------------- |
| creditnumber| string      | null: false                     |
| exdate      | string      | null: false                     |
| codenumber  | string      | null: false                     |
| user_buyer  | string      | null: false                     |
| item_user   | string      | null: false                     |

### Association

- has_one    :user
- has_many   :items
- has_one    :shipping
  
## shippings テーブル

| Column      | Type        |  Options                        |
| ----------- | ----------- | ------------------------------- |
| postal_code | string      | null: false                     |
| prefectures | string      | null: false                     |
| municipality| string      | null: false                     |
| address     | string      | null: false                     |
| building    | string      |                                 |
| phone       | string      | null: false                     |
| user_buyer  | string      | null: false                     |
| item_user   | string      | null: false                     |

### Association

- belongs_to :buyer
- 