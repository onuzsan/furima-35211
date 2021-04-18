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

| Column   | Type        | Options                         |
| -------- | ----------- | ------------------------------- |
| nickname | string      | null: false                     |
| email    | string      | null: false                     |
| password | string      | null: false                     |
| name     | string      | null: false                     |
| kananame | string      | null: false                     |
| birthday | string      | null: false                     |
| buyer    |  references | null: false, foreign_key: true  |

### Association

- has_many :items
- has_many :comments
- has_one  :buyer

## items テーブル

| Column    | Type        | Options                         |
| --------  | ----------- | ------------------------------- |
| image     |             | null: false                     |
| title     | string      | null: false                     |
|description| text        | null: false                     |
| category  | string      | null: false                     |
| shipping  | string      | null: false                     |
| area      | string      | null: false                     |
| days      | string      | null: false,                    |
| price     | integer     | null: false,                    |
| user      | references  | null: false, foreign_key: true  |
| buyer     | references  | null: false, foreign_key: true  |


### Association

- has_many   :comments
- belongs_to :users
- has_one    :buyer

## comments テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| items_id| references | null: false, foreign_key: true |
| comment | string     | null: false                    |

### Association

- belongs_to :item
- belongs_to :user

## buyers テーブル

| Column      | Type        | Options                         |
| --------    | ----------- | ------------------------------- |
| creditnumber| string      | null: false                     |
| exdate      | string      | null: false                     |
| codenumber  | string      | null: false                     |
| shippingadd | string      | null: false                     |
| prefectures | string      | null: false                     |
| municipality| string      | null: false                     |
| address     | string      | null: false                     |
| building    | string      |                                 |
| phonenumber | string      | null: false                     |



### Association

- has_one    :user
- has_one    :item