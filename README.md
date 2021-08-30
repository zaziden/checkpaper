# README

# テーブル設計

## users テーブル（ショップ）

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association
* has_many :guests
* has_many :menus
* has_many :staffs
* has_many :checkrooms
* has_many :checks

## guests テーブル（客情報）

| Column        | Type       | Options                        |
| ------------- | ---------- | -------------------------------|
| guest_name    | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
* belongs_to :user

## menus テーブル（メニュー）

| Column    | Type         | Options                        |
| ----------| ------------ | ------------------------------ |
| menu_name | string       | null: false                    |
| price     | integer      | null: false                    |
| user      | references   | null: false, foreign_key: true |

### Association
* belongs_to :user

## staffs テーブル（従業員)

| Column    | Type         | Options                        |
| ----------| ------------ | ------------------------------ |
| nickname  | string       | null: false                    |
| user      | references   | null: false, foreign_key: true |

### Association
* belongs_to :user

## checkrooms テーブル（伝票）

| Column     | Type       | Options                        |
| -----------|------------|--------------------------------|
| user       | references | null: false, foreign_key: true |
| room_name  | integer    | null: false                    |
| staffname  | integer    |                                |

### Association
* belongs_to :user
* has_one :check

## checks テーブル（注文）

| Column      | Type       | Options                        |
| ------------| ---------- | -------------------------------|
| room        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |
| menuname    | string     | null: false                    |
| menuprice   | integer    | null: false                    |
| cup         | integer    | null: false                    |

### Association
* belongs_to :user
* belongs_to :room
