## はじめに

• 本リポジトリは勤務時間管理システム「TimeTrack」のバックエンド部分に関するものです。
• 本番環境は以下の URL となります。
https://time-track-frontend.vercel.app/
• フロントエンド部分は以下の URL からご確認ください。
https://github.com/Yu-Kashiro/TimeTrack-frontend

## このアプリを作成した理由

• 現在の職場において、一部の職員の勤務時間管理を紙媒体で手作業で行っていました。非効率かつ計算作業が発生するため、その作業を効率化するために、このアプリを作成しました。
• 使用者は、主に 40 代〜60 代の女性です。スマートフォン操作に不慣れな方もいるため、シンプルな UI を目指しました。
• 各個人のスマートフォンで使用する前提のため、モバイル表示に最適化しています。

## アプリ概要

• 勤怠時間の記録・編集・削除ができる勤怠管理システムです。
• 始業時間・終業時間・休憩時間の入力や、有給休暇の管理が可能です。

## デモ動画

• ゲストログイン機能を用意しています。以下の動画を参考に、実際にお試しください。


### 認証機能

• ユーザー登録・ログイン・ログアウト機能（Devise + DeviseTokenAuth）
• ゲストログイン機能

### 勤怠記録機能

• 出勤時間の新規登録
• 既存データの編集・更新・削除
• 有給休暇の記録

## 環境

• 開発言語: Ruby 3.2.8
• フレームワーク: Ruby on Rails 7.2.2(APIモード)
• データベース: PostgreSQL 17.4
• 認証: Devise 4.9.4 + DeviseTokenAuth 1.2.5
• CORS 対応: rack-cors 3.0.0
• 検証済み OS: macOS Sequoia 15.5（24F74）

## プロジェクト構成

```
app/
├── controllers/       # コントローラー
│   ├── application_controller.rb
│   ├── work_times_controller.rb
│   └── auth/         # 認証関連コントローラー
└── models/           # モデル
    ├── user.rb
    ├── work_time.rb
    └── job.rb
config/
├── routes.rb         # ルーティング設定
├── database.yml      # データベース設定
└── initializers/     # 初期化設定
db/
├── migrate/          # マイグレーションファイル
└── schema.rb         # データベーススキーマ
```

## おわりに

• 感想・コメント・改善提案等があれば Issue や Pull Request をお待ちしております
