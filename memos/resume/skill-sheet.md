# スキルシート

## プロフィール

| key      | value                                  |
| -------- | -------------------------------------- |
| 氏名     | 加藤 義晴                              |
| 生年月日 | 1995年                                 |
| 最終学歴 | 名城大学理工学部メカトロニクス工学科卒 |
| 居住地   | 愛知県                                 |
| GitHub   | <https://github.com/kato-yoshiharu>    |
| Zenn     | <https://zenn.dev/suimenkathemove>     |

## スキル

| key             | value                      |
| --------------- | -------------------------- |
| 言語            | TypeScript/Rust/Go         |
| フレームワーク  | React.js/Next.js/Axum/Echo |
| DB              | PostgreSQL/DynamoDB        |
| API Protocol    | REST/GraphQL               |
| AI Coding Agent | Claude Code, Cursor        |

## 自己PR

「怠惰を求めて勤勉に行き着く」がモットーです。
オンラインエディタの開発では、テーブルの複数セルのセレクションや行・列の削除、マージされたセルを考慮したリサイズ、インデントなど、状態と座標計算が複雑に絡む機能を実装してきました。
個人開発でも、Google Calendarライクなカレンダーコンポーネント、Notionライクなドラッグ&ドロップで並び替え可能なツリー、矩形選択コンポーネントなどをライブラリとして公開しており、リッチUIの実装には自信があります。

## この先やってみたいこと

フロントエンドからバックエンド、DB設計まで一貫して担当してきた経験に加えて、AWSなどのインフラ領域にも踏み込み、アーキテクチャ設計からデプロイ・運用まで、プロダクト開発に必要なすべての領域をカバーできるエンジニアになりたいです。
技術選定やスキーマ設計から関わり、設計の意思決定とチームの技術的な牽引を担うリードエンジニアを目指しています。
Claude CodeなどのAI Coding Agentを前提とした開発プロセスの設計にも関心があり、チーム全体の生産性を上げる仕組みづくりに取り組みたいです。

## ポートフォリオ/記事

- [react-sandbox](https://github.com/kato-yoshiharu/react-sandbox)
  - [Google Calendarライクなコンポーネント](https://github.com/kato-yoshiharu/react-sandbox/tree/main/src/components/ui-components/WeeklyCalendar)
    - [デモ](https://kato-yoshiharu.github.io/react-sandbox/?path=/story/components-ui-components-weeklycalendar--default)
- Notionライクなアプリ(開発中)
  - [notion-clone](https://github.com/kato-yoshiharu/notion-clone)
    - [デモ](https://notion-clone-frontend.kato-yoshiharu.workers.dev)
  - [木構造をSQLで実装](https://zenn.dev/suimenkathemove/articles/sql-closure-table-for-tree)
  - [react-notion-sortable-tree](https://github.com/kato-yoshiharu/react-notion-sortable-tree)
    - [デモ](https://kato-yoshiharu.github.io/react-notion-sortable-tree)
  - [react-select-rectangle](https://github.com/kato-yoshiharu/react-select-rectangle)
    - [デモ](https://kato-yoshiharu.github.io/react-select-rectangle)

## 経歴

### チームラボエンジニアリング(正社員) 2019/04~2020/03

技術スタック: TypeScript/Vue.js/Nuxt.js
規模: バックエンド5名 / フロントエンド2名
担当工程: 実装 / テスト / 保守・運用

- [チームラボAIbot](https://www.team-lab.com/teamlabaibot/)の開発
- [チームラボAIbot](https://www.team-lab.com/teamlabaibot/)の管理画面の開発
- [チームラボチケットシステム](https://www.team-lab.com/ticket/)の開発

### Stayway(正社員) 2020/03~2020/12

技術スタック: TypeScript/Next.js
規模: バックエンド2名 / フロントエンド1名
担当工程: 基本設計 / 詳細設計 / 実装 / テスト

- 旅行メディアサイト+旅行SNSアプリ[stayway media](https://stayway.jp/tourism)の開発
- 地域の食・体験のクラウドファンディングアプリ[stayway ticket](https://stayway.jp/projects)の開発

### MedUp(業務委託) 2021/01~2021/07

技術スタック: TypeScript/Next.js
規模: フルスタック3名 / フロントエンド1名
担当工程: 詳細設計 / 実装 / テスト

- 医療機関の営業支援・顧客管理ツール[foro CRM](https://www.foro-crm.jp/)の開発

### FRAIM(業務委託) 2021/07~2025/02

技術スタック: TypeScript/React.js/Next.js/Rust/Axum/GraphQL/DynamoDB/PostgreSQL

#### 契約書のオンラインエディタ[lawgue](https://lawgue.com/)の開発

規模: フルスタック10名ほど / インフラ1名 / ML2名
担当工程: 実装 / テスト / 保守・運用

フロントエンド領域で最も実装が難しいソフトウェアの1つであるエディタ。そのフロントエンドとバックエンドの機能追加と改修を担当。

- テーブルの、複数選択した行や列を削除する機能の実装
- コメントのメンションの抽出の作り直し
- 通知の既読機能の実装
- Popoverコンポーネントの座標の計算の作り直しと、枠からはみ出る場合の折り返しの実装
- テーブルの幅や高さのリサイズの線の、マージされたセルの考慮
- textlintのPoC
- エディタのメニューをVSCodeのアクティビティバーのように縦にする
- ドキュメントの履歴の任意のバージョンのプレビューページの作成
- テーブルのインデントの実装
- 行末に半角スペースがある場合は行を折り返さないように修正
- テーブルの複数セルのセレクションの移動の実装

#### ドキュメント作成ツールの開発

規模: バックエンド1名 / フロントエンド1名
担当工程: 基本設計 / 詳細設計 / 実装 / テスト

DnDで木構造のスクリプトを作成し、そのスクリプトを実行することによってアンケートを作成し、そのアンケートを答えることによってドキュメントを作成する。
スクリプトの要素には、ドキュメントの読み込み、スクリプトの読み込み、変数の代入、分岐、反復、テキストの挿入、入力(テキスト)、入力(選択)がある。
フロントエンドの開発の立ち上げから担当。

### クロステックマネジメント(業務委託) 2024/09~2025/08

技術スタック: TypeScript/Next.js/Go/Echo/PostgreSQL
規模: フルスタック4名
担当工程: 基本設計 / 詳細設計 / 実装 / テスト

- オンボーディングタスク管理アプリのフロントエンドとバックエンドの開発
- 教材アプリのフロントエンドとバックエンドの開発
  - 動画教材のVideoPlayer機能の開発
  - 教材の同期APIのリファクタリングとパフォーマンス改善
    - 複数ファイルのアップロードを並行処理化

### 株式会社estie(業務委託) 2025/04~2026/05

技術スタック: TypeScript/Next.js/Rust/Actix Web/GraphQL/PostgreSQL
規模: フルスタック10名
担当工程: 基本設計 / 詳細設計 / 実装 / テスト / 保守・運用

不動産の売買管理システムのバックエンド、フロントエンドの開発

- OCR機能のハイライトの座標取得の改善
- 住所の正規化のマイグレーションスクリプト(並列処理)の作成
- ダンプデータのエクスポートのスクリプトの作成
- フリーワード検索APIの作成
- 一覧ページのソート機能の実装
- ヒストグラム機能のバックエンドとフロントエンドの改修
- マッチング機能のAPIの追加

### 株式会社WEEL(業務委託) 2026/06~2026/08

技術スタック: TypeScript/Next.js/TailwindCSS/shadcn + Radix UI/assistant-ui
状態管理: TanStack Query/nuqs
テストツール: Vitest/Testing Library/Playwright/Storybook
規模: バックエンド1名 / フロントエンド1名
担当工程: 基本設計 / 詳細設計 / 実装 / テスト

自社製品に関する問い合わせの回答をサポートするチャットボットの開発。
フロントエンドの開発を立ち上げから1人で担当。

- Microsoft Entra ID(MSAL)によるSSO認証の実装
- 問い合わせ一覧の無限スクロールの実装
- ChatGPTのようなUIの実装

#### 生成AIの活用

Claude Codeを開発プロセスに組み込み、人間は意思決定とレビューを担当し、AIは実装を担当する体制で開発を進めました。

- ハーネスエンジニアリング
  - メモリファイルにコンテキストを書き、AIがミスをするたびにルールを改善して同じミスを繰り返さない仕組みを整備
  - 定型作業をSkillとして切り出し、繰り返し実行できるように整備
  - Hooksで、LintやTestなどの機械的なチェックを自動実行させる
- ADR駆動開発
  - ADRを実装後の記録ではなく実装前の仕様書として書き、設計判断の背景をAIとチームの共通コンテキストにする
- サブエージェントによるレビュー
  - 実装したエージェント自身は自分のコードを高く評価するため、レビュー専用のサブエージェント(Devil's Advocate)を用意し、批判的にレビューさせる
- git worktreeによる並列開発
  - 作業ツリーを複数用意してAIを並列実行。ポート番号やコンテナ名が衝突しないよう、環境変数ひとつでローカル環境を分離できるSkillを整備
