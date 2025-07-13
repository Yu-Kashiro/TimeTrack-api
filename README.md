## はじめに

- 本リポジトリは勤務時間管理システム「TimeTrack」のバックエンド部分に関するものです。
- 本番環境は以下の URL となります。  
  https://time-track-frontend.vercel.app/
- フロントエンド部分は以下の URL からご確認ください。  
  https://github.com/Yu-Kashiro/TimeTrack-frontend

## このアプリを作成した理由・状況

- 現在の職場では、一部の職員の勤務時間管理を紙媒体で行っており、非効率で計算作業も発生していました。これらの作業を効率化するために、このアプリを作成しました。
- 使用者は、主に 40 代〜60 代の女性です。スマートフォン操作に不慣れな方もいるため、シンプルな UI を目指しました。
- 各個人のスマートフォンで使用する前提のため、モバイル表示に最適化しています。

## アプリ概要

- 勤怠時間の記録・編集・削除ができる勤怠管理システムです。
- 始業時間・終業時間・休憩時間の入力や、有給休暇の管理が可能です。

## デモ動画

- ゲストログイン機能を用意しています。以下の動画を参考に、実際にお試しください。

https://github.com/user-attachments/assets/3e8a95e5-620c-4a9e-bba6-71b93f31988c

- 新規登録方法

https://github.com/user-attachments/assets/358a4d7e-dc87-4569-b84f-de18b5c77b13

- 通常ログインでCRUD操作

https://github.com/user-attachments/assets/61871314-af98-4a97-b731-5bc366efae5e

## 機能一覧

### 認証機能

- ユーザー登録・ログイン・ログアウト機能（Devise + DeviseTokenAuth）
- ゲストログイン機能

### 勤怠記録機能

- 出勤時間の新規登録
- 既存データの編集・更新・削除
- 有給休暇の記録

## 環境

- 開発言語: Ruby 3.2.8
- フレームワーク: Ruby on Rails 7.2.2(API モード)
- データベース: PostgreSQL 17.4
- 認証: Devise 4.9.4 + DeviseTokenAuth 1.2.5
- CORS 対応: rack-cors 3.0.0
- 検証済み OS: macOS Sequoia 15.5（24F74）

## 実装予定の機能

- 管理者画面の実装
- 勤怠データのエクスポート機能
- 勤怠データの承認機能
- 残業時間の管理

## おわりに

- 感想・コメント・改善提案等があれば Issue や Pull Request をお待ちしております
