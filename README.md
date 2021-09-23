# README

## アプリケーション名
* checkpaper

## アプリケーション概要
* 主に飲食店の売上計算やデジタル伝票としてお使いいただけます。

## テスト用アカウント
* 

## 利用方法
* 

## 目指した課題解決
* ノートや紙伝票で管理していた売上やオーダーなどを、パソコン1台で簡単に管理できる事を目指しました。

## 洗い出した要件
* 

## 実装予定の機能
* 経費の管理機能
* タブレットやスマフォでも使用可能に実装

## ローカルでの動作方法
* 

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
* has_many :allsales

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
| price     | integer      |                                |
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
* has_one :allsale

## checks テーブル（注文）

| Column      | Type       | Options                        |
| ------------| ---------- | -------------------------------|
| checkroom   | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |
| menuname    | string     | null: false                    |
| menuprice   | integer    | null: false                    |
| cup         | integer    | null: false                    |

### Association
* belongs_to :user
* belongs_to :checkroom

## allsales テーブル（精算金額）

| Column      | Type       | Options                        |
| ------------| ---------- | -------------------------------|
| checkroom   | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |
| allprice    | integer    | null: false                    |
| checkstaff  | string     | null: false                    |

### Association
* belongs_to :user
* belongs_to :checkroom

