# README

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| family_name        | string | null: false               |
| first_name_kana    | string | null: false               |
| family_name_kana   | string | null: false               |
| birthday           | date   | null: false               |


### Association

- has_many :items
- has_many :purchases

## itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| status_id       | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| area_id         | integer    | null: false                    |
| day_id          | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |


## Association

- belongs_to :user
- has_many :images
- has_one :purchase

## imagesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| image  | string     | null: false                    |
| item   | references | null: false, foreign_key: true |


## Association

- belongs_to :item

## purchasesテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |


## Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| code     | string     | null: false                    |
| area_id  | integer    | null: false                    |
| city     | string     | null: false                    |
| number   | string     | null: false                    |
| phone    | string     | null: false                    |
| building | string     | null: false                    |
| purchase | references | null: false, foreign_key: true |


## Association

- belongs_to :purchase