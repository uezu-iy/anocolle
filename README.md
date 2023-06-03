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
<img width="400" alt="image" src="https://github.com/uezu-iy/anocolle/assets/127666360/6d518e79-b821-4ff5-bee6-17857f19c0b9">

---
### 2. 

---

## 工夫した点
Action Textの導入
* 異常の詳細や必要な部品、画像などを細かく分けて実装するより、ActionTextを導入することで、
まとめて記述できるようにした方が自由度があり、書きやすいと思ったので導入しました。


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

　





```mermaid
  graph TD;
      A-->B;
      A-->C;
      B-->D;
      C-->D;
```

```mermaid
erDiagram
  users ||--o{ anomalys : "1人のユーザーは0以上の投稿を持つ"
  tags ||--o{ anomalys : "1人のユーザーは0以上の投稿を持つ"
  tags ||--o{ anomalys_tag : "1人のユーザーは0以上の投稿を持つ"
  
  users {
    id bigint
    name　string 
    created_at　timestamp 
    deleted_at　timestamp 
  }
  
  anomalys {
    id bigint
    title　string
    content text
    user_id bigint
    created_at　timestamp 
    deleted_at　timestamp 
  }
  
  anomalys_tag {
    id bigint
    anomaly_id bigint
    tag_id bigint
    created_at　timestamp 
    deleted_at　timestamp 
  }
  
  tags {
    id bigint
    tag_name string
    created_at　timestamp 
    deleted_at　timestamp 
  }
  
  
  
```




posts {
    PK　id　bigint
    FK　user　references  
    title　string
    content　text 
    created_at　timestamp
    deleted_at　timestamp
  }







```mermaid　
erDiagram
  users ||--o{ posts : "1人のユーザーは0以上の投稿を持つ"
  users ||--o{ comments: "1人のユーザーは0以上のコメントを持つ"
  posts ||--o{ comments: "1つの投稿は0以上のコメントを持つ"

  users {
    bigint id PK
    string name "ユーザー名"
    timestamp created_at
    timestamp deleted_at
  }

  posts {
    bigint id PK
    references user FK
    string title "投稿タイトル"
    text content "投稿内容"
    timestamp created_at
    timestamp deleted_at
  }

  comments {
    bigint id PK
    references post FK
    references user FK
    text content "コメント内容"
    timestamp created_at
    timestamp deleted_at
  }
```　




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
