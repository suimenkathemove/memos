# スキルシート

## プロフィール

| key      | value                                  |
| -------- | -------------------------------------- |
| 氏名     | 加藤 義晴                              |
| 性別     | 男性                                   |
| 生年月日 | 1995年                                 |
| 最終学歴 | 名城大学理工学部メカトロニクス工学科卒 |
| 居住地   | 愛知県                                 |
| GitHub   | <https://github.com/suimenkathemove>   |
| Zenn     | <https://zenn.dev/suimenkathemove>     |

## スキル

| key            | value                 |
| -------------- | --------------------- |
| 言語           | TypeScript/Rust       |
| フレームワーク | React.js/Next.js/Axum |
| DB             | PostgresQL/DynamoDB   |
| API Protocol   | REST/GraphQL          |
| その他         | Docker/GitHub Actions |

## 自己PR

「怠惰を求めて勤勉に行き着く」がモットー(にしたい)です。
フルスタックで幅広い開発経験があります。フロントエンドでは1から1人で開発した経験が多々あります。
実装力と自走力に自信があります。複雑なロジックのアプリを開発するのが好きで得意だと思います。
また、バグ改修が得意です。

## ポートフォリオ

- [typescript-sandbox](https://github.com/suimenkathemove/typescript-sandbox)
- [rust_sandbox](https://github.com/suimenkathemove/rust_sandbox)
- [react-sandbox](https://github.com/suimenkathemove/react-sandbox)
  - [Google Calendarライクなコンポーネント](https://github.com/suimenkathemove/react-sandbox#weeklycalendar)
  - [Markdown WYSIWYG Editor](https://github.com/suimenkathemove/react-sandbox#wasmmarkdowneditor)
- [monorepo-sandbox](https://github.com/suimenkathemove/monorepo-sandbox)
  - Notionライクなアプリを開発中
    - [木構造をSQLで実装](https://zenn.dev/suimenkathemove/articles/sql-closure-table-for-tree)
- [開発サーバを自動的に立ち上げるスクリプト](https://github.com/suimenkathemove/monorepo-sandbox/blob/main/dev.sh)
- [複数ディスプレイ間でマウスを移動させるスクリプト](https://github.com/suimenkathemove/dotfiles/blob/main/applescripts/move-between-displays.applescript)

## 経歴

| No. | 期間                      | 会社                                         | 業務内容                                                                                            | 規模                                | プログラミング言語・フレームワーク        | ツール                | データベース | 要件定義 | 基本設計 | 詳細設計 | 実装 | テスト | 保守・運用 |
| --- | ------------------------- | -------------------------------------------- | --------------------------------------------------------------------------------------------------- | ----------------------------------- | ----------------------------------------- | --------------------- | ------------ | -------- | -------- | -------- | ---- | ------ | ---------- |
| 1   | 2019/04~2020/03           | チームラボエンジニアリング株式会社（正社員） | **[チームラボAIbot](https://www.team-lab.com/teamlabaibot/)の開発**                                 | 1人                                 | TypeScript/Vue.js                         | -                     | -            | -        | -        | x        | x    | -      | x          |
| ^   | ^                         | ^                                            | **[チームラボAIbot](https://www.team-lab.com/teamlabaibot/)の管理画面の開発**                       | 4人                                 | TypeScript/Nuxt.js                        | -                     | -            | -        | -        | x        | x    | -      | x          |
| ^   | ^                         | ^                                            | **[チームラボチケットシステム](https://www.team-lab.com/ticket/)の開発**                            | フロントエンド2人/バックエンド10人  | TypeScript/Vue.js                         | -                     | -            | -        | -        | x        | x    | -      | x          |
| 2   | 2020/03~2020/12           | 株式会社Stayway（正社員）                    | **旅行メディアサイト+旅行SNSアプリ[stayway media](https://stayway.jp/tourism)の開発**               | フロントエンド1人/バックエンド2人   | TypeScript/Next.js                        | Docker/GitHub Actions | -            | -        | -        | x        | x    | -      | x          |
| ^   | ^                         | ^                                            | **地域の食・体験のクラウドファンディングアプリ[stayway ticket](https://stayway.jp/projects)の開発** | フロントエンド1人/バックエンド2人   | TypeScript/Next.js                        | Docker/GitHub Actions | -            | -        | -        | x        | x    | -      | x          |
| 3   | 2021/01~2021/07           | 株式会社MedUp（業務委託）                    | **医療機関の営業支援・顧客管理ツール[foro CRM](https://www.foro-crm.jp/)の開発**                    | フロントエンド3人/バックエンド3人   | TypeScript/Next.js                        | CircleCI              | -            | -        | -        | x        | x    | x      | x          |
| 4   | 2021/07~2021/08, 2022/09~ | FRAIM株式会社（業務委託）                    | **契約書のオンラインエディタ[lawgue](https://lawgue.com/)の開発**                                   | フロントエンド10人/バックエンド15人 | TypeScript/React.js/Rust/Axum/GraphQL     | Docker/GitHub Actions | DynamoDB     | -        | -        | -        | x    | x      | x          |
| 5   | 2021/08~2022/09           | ^                                            | **ドキュメント作成ツールの開発**                                                                    | フロントエンド1人/バックエンド1人   | TypeScript/Next.js/Rust/Axum/GraphQL/WASM | GitHub Actions        | PostgresQL   | -        | -        | x        | x    | x      | x          |

### 契約書のオンラインエディタ[lawgue](https://lawgue.com/)の開発

#### プロジェクト概要

契約書のオンラインエディタ[lawgue](https://lawgue.com/)の開発

#### 業務内容

フロントエンド領域で最も実装が難しいソフトウェアの1つであるエディタ。
そのフロントエンドとバックエンドの機能追加と改修を担当。

##### 主なタスク

- 表の、複数選択した行や列を削除する機能の実装
- ドキュメントのステータス(下書き・レビュー中・完了など)を増やす
- コメントのメンションの抽出の作り直し
- 通知の既読機能の実装
- Popoverコンポーネントの座標の計算の作り直しと、枠からはみ出る場合の折り返しの実装
- Zendeskの対応
- テーブルの幅や高さのリサイズの線の、マージされたセルの考慮
- textlintのPoC
- 画像をWebPに変換するマイグレーションツールの作成
- MLの用字用語をチェックするAPIをラップするAPIの作成
- Playwrightのセットアップ
- エディタのメニューをVSCodeのアクティビティバーのように縦にする
- ドキュメントの履歴の任意のバージョンのプレビューページの作成
- テーブルのインデントの実装
- 行末に半角スペースがある場合は行を折り返さないように修正
- テーブルのセルのセレクションの移動の実装

### ドキュメント作成ツールの開発

#### プロジェクト概要

DnDで木構造のスクリプトを作成し、そのスクリプトを実行することによってアンケートを作成し、そのアンケートを答えることによってドキュメントを作成する。
スクリプトの要素には、ドキュメントの読み込み、スクリプトの読み込み、変数の代入、分岐、反復、テキストの挿入、入力（テキスト）、入力（選択）がある。

#### 業務内容

フロントエンドの開発の立ち上げから担当。
