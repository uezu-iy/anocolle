# README

## アプリ概要
工場などの製造の現場で機械の異常を共有、投稿できるサービスです。
* 現場にいない人や新人が過去にあった異常を検索し確認できる。
* 異常の対処法や何が必要かどんな物が現場で足りてないか投稿できる。
* 外部の人が現場であった異常についてコメントできる。

## 製作背景
工場で働いたことがあり、現場でこれまであった異常とその対応方法を経験の浅い人が学習できたり、
また現場にいない部署の方が現場で起こっている異常や必要なものを把握することができるアプリがあれば、
便利であると思い作成しました。

## 機能と使い方

### 1. トップページ
<img width="500" alt="image" src="https://github.com/uezu-iy/anocolle/assets/127666360/6d518e79-b821-4ff5-bee6-17857f19c0b9">

---
### 2. 異常の検索
キーワードで異常の検索ができる。また、タグをクリックするとタグに紐づいた投稿一覧を表示できる。

<img width="450" alt="image" src="https://github.com/uezu-iy/anocolle/assets/127666360/66164947-f66d-4e65-9751-13f6a7c6e40d">
<img width="470" alt="image" src="https://github.com/uezu-iy/anocolle/assets/127666360/5bbde805-3ae7-4484-87fc-5ceb08f1878e">

---
### 3. 投稿詳細画面
異常の詳細を確認できる。

<img width="500" alt="image" src="https://github.com/uezu-iy/anocolle/assets/127666360/c826185e-68aa-42a4-949d-58dc5510cbe0">

---

### 4. コメント機能
投稿詳細画面で異常の投稿に対して、コメントできる。

<img width="500" alt="image" src="https://github.com/uezu-iy/anocolle/assets/127666360/4553a6c0-5a9e-4272-b802-c0d511adf067">

---

### 5. マイページ

ユーザーの投稿履歴を確認できる。

<img width="500" alt="image" src="https://github.com/uezu-iy/anocolle/assets/127666360/9c2ae70f-5645-44bf-890f-cab803371fed">
<img width="500" alt="image" src="https://github.com/uezu-iy/anocolle/assets/127666360/cd9c35ea-7f02-4da6-84dc-791deb4c7e64">

## 工夫した点
#### Action Textの導入
* 異常の詳細や必要な部品、画像などを細かく分けて実装するよりActionTextを導入することで、
まとめて記述できるようにした方が自由度があり書きやすいと思ったので導入しました。

#### タグ機能と検索機能
* カテゴリーごとに投稿を分けようと考えたのですが、追加したいカテゴリーが増えていき収集がつかなくなると思ったので、
いっそタグで管理した方がわかりやすく、種類が多くなっても問題ないので採用しました。


## 機能一覧

| No. | 機能 | gem |
|:---:|:---:|:---:|
|1|ログイン・ログアウト|devise|
|2 |アカウント登録、設定変更|devise|
|3 |異常投稿欄|ActionText|
|4 |検索機能|ransack|
|5 |ページネーション|kaminari|
|6 |レスポンシブデザイン|Bootstrap|
|7 |テスト|RSpec / FactoryBot/ Faker |
|8 |静的コード解析|Rubocop|
|9 |ゲストログイン||
|10 |異常投稿機能(CRUD)||
|11|タグ機能||
|12 |コメント機能||


## ER図

<img width="1031" alt="image" src="https://github.com/uezu-iy/anocolle/assets/127666360/b84f9248-3cd5-4b37-959f-2451af4b533f">


## インフラ構成図

<img width="1176" alt="image" src="https://github.com/uezu-iy/anocolle/assets/127666360/e421cfbb-3017-4b5c-afc0-f8d2ee461f1a">

## 使用技術

* 言語 : Ruby(3.1.3)
* フレームワーク : Ruby on Rails(6.1.7.3)
* フロントエンド : HTML&CSS/Bootstrap/Javascript
* DB : PostgreSQL
* テスト : RSpec
* 旧インフラ : Heroku + AWS(S3)
* 新インフラ : AWS(VPC, EC2, RDS, S3, ACM, ALB, IAM) + Capistrano,CircleCI
* ソースコード管理：GitHub
* 開発環境：MacOS/Visual Studio Code

　

