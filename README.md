# README

## usersテーブル

| Column           | Type   | Options                   |
| ---------------- | ------ | ------------------------- |
| nickname         | string | null: false               |
| email            | string | null: false, unique: true |
| password         | string | null: false               |
| first_name       | string | null: false               |
| family_name      | string | null: false               |
| first_name_kana  | string | null: false               |
| family_name_kana | string | null: false               |
| birthday         | date   | null: false               |


### Association

- has_many :items
- has_many :purchases

## itemsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| description  | text       | null: false                    |
| category     | string     | null: false                    |
| status       | string     | null: false                    |
| delivery_fee | string     | null: false                    |
| area         | string     | null: false                    |
| day          | string     | null: false                    |
| price        | string     | null: false                    |
| user_id      | references | null: false, foreign_key: true |


## Association

- belongs_to :users
- has_many :images
- has_one :purchases

## imagesテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| image   | string     | null: false                    |
| item_id | references | null: false, foreign_key: true |


## Association

- belongs_to :items

## purchasesテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| item_id    | references | null: false, foreign_key: true |
| address_id | references | null: false, foreign_key: true |


## Association

- belongs_to :users
- belongs_to :items
- has_one :addresses

## addressesテーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| code         | string  | null: false                    |
| prefectures  | string  | null: false                    |
| city         | string  | null: false                    |
| number       | string  | null: false                    |
| phone        | integer | null: false                    |


## Association

- belongs_to :purchases