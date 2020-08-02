# 概要

目的（内容）：メッセージ・スケジュールアプリ<br>
ターゲット：不動産売買の営業<br>
開発経緯：不動産売買の営業をしていく中で、取引件数が増加していくと、お客様の物件紹介であったり、案内や契約引き渡しの告知の管理やスケジュールの管理が難しくなります。<br>
その際、お客様に対して、メッセージのやり取りの履歴やスケジュール表等があれば便利だと思い、作成をしたいと思いました。<br>

## 開発期間と平均作業時間

・開発期間：約 1 週間
・1 日あたりの平均作業時間：約 8 時間

## 開発体制

・人数：1 名<br>

### 接続先情報

URL http://54.248.52.91 <br>

**テスト用アカウント等**<br>
投稿者用<br>
・メールアドレス: a@a.com<br>
・パスワード: 123456789<br>  

コメント用<br>
・メールアドレス名: b@b.com<br>
・パスワード: 123456789<br>

# 機能一覧

・ユーザー登録<br>
・ログイン、ログアウト機能<br>
・メッセージの投稿、編集、削除機能<br>
・コメント機能<br>
・カレンダーの投稿、編集、削除機能<br>

# 動作確認方法

- Chrome の最新版を利用してアクセスしてください。
- ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
- 接続先およびログイン情報については、下記の通りです。
- 同時に複数の方がログインしている場合に、ログインできない可能性があります。

## メッセージ投稿方法は以下の手順で確認できます

- テストアカウントでログイン → トップページの右上の「投稿する」ボタン押下 → メッセージを入力 → 「SEND」を押下

## コメント投稿は以下の手順で確認できます

- テストアカウントでログイン → トップページからメッセージの右上の詳細「ボタン」を押下 → コメントを入力 → 「SEND」を押下

- 確認後、ログアウト処理をお願いします。

# 使用技術

## ◼︎ 言語

### バックエンド

Ruby 2.5.1

### マークアップ言語

HTML<br>
CSS<br>

### マークアップ記法

haml<br>
SCSS<br>

## ◼︎ フレームワーク

Ruby on Rails 5.2.3

## ◼︎ データベース

MySQL 5.6.47

## ◼︎ インフラ

AWS EC2<br>
AWS S3

## ◼︎ デプロイ

Capistrano による自動デプロイ

# DB 設計

## users テーブル

| Column           | Type   | Options                   |
| ---------------- | ------ | ------------------------- |
| name             | string | null: false               |
| email            | string | null: false, unique: true |
| password         | string | null: false               |


### Association

- has_many :comments
- has_many :questions


## quesitons テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| text        | string     | null: false       |
| user        | references | foreign_key: true |

### Association

- has_many :comments

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| question| references | null: false, foreign_key: true |

### Association

- belongs_to :question
- belongs_to :user

## meetings テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| start_time       | datetime   | null: false                    |
