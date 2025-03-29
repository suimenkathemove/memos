# スキルシート

- [スキルシート](#スキルシート)
  - [プロフィール](#プロフィール)
  - [スキル](#スキル)
  - [ポートフォリオ/記事](#ポートフォリオ記事)
  - [経歴](#経歴)
    - [チームラボエンジニアリング(正社員) 2019/04~2020/03](#チームラボエンジニアリング正社員-201904202003)
    - [Stayway(正社員) 2020/03~2020/12](#stayway正社員-202003202012)
    - [MedUp(業務委託) 2021/01~2021/07](#medup業務委託-202101202107)
    - [FRAIM(業務委託) 2021/07~2025/02](#fraim業務委託-202107202502)
      - [契約書のオンラインエディタlawgueの開発](#契約書のオンラインエディタlawgueの開発)
      - [ドキュメント作成ツールの開発](#ドキュメント作成ツールの開発)
    - [クロステックマネジメント(業務委託) 2024/09~現在](#クロステックマネジメント業務委託-202409現在)

## プロフィール

| key      | value                                  |
| -------- | -------------------------------------- |
| 氏名     | 加藤 義晴                              |
| 生年月日 | 1995年                                 |
| 最終学歴 | 名城大学理工学部メカトロニクス工学科卒 |
| 居住地   | 愛知県                                 |
| GitHub   | <https://github.com/suimenkathemove>   |
| Zenn     | <https://zenn.dev/suimenkathemove>     |

## スキル

| key            | value                      |
| -------------- | -------------------------- |
| 言語           | TypeScript/Rust/Go         |
| フレームワーク | React.js/Next.js/Axum/Echo |
| DB             | PostgresQL/DynamoDB        |
| API Protocol   | REST/GraphQL               |

<!-- ## 自己PR -->

<!-- 「怠惰を求めて勤勉に行き着く」がモットー(にしたい)です。<br/> -->

## ポートフォリオ/記事

- [react-sandbox](https://github.com/suimenkathemove/react-sandbox)
  - [Google Calendarライクなコンポーネント](https://github.com/suimenkathemove/react-sandbox/tree/main/src/components/ui-components/WeeklyCalendar)
  - [Markdown WYSIWYG Editor](https://github.com/suimenkathemove/react-sandbox/tree/main/wasm/src/wasm_markdown_editor)
- Notionライクなアプリ(開発中)
  - [notion-clone](https://github.com/suimenkathemove/notion-clone)
  - [木構造をSQLで実装](https://zenn.dev/suimenkathemove/articles/sql-closure-table-for-tree)
  - [react-notion-sortable-tree](https://github.com/suimenkathemove/react-notion-sortable-tree)
  - [react-select-rectangle](https://github.com/suimenkathemove/react-select-rectangle)

## 経歴

### チームラボエンジニアリング(正社員) 2019/04~2020/03

技術スタック: TypeScript/Vue.js/Nuxt.js

- [チームラボAIbot](https://www.team-lab.com/teamlabaibot/)の開発
- [チームラボAIbot](https://www.team-lab.com/teamlabaibot/)の管理画面の開発
- [チームラボチケットシステム](https://www.team-lab.com/ticket/)の開発

### Stayway(正社員) 2020/03~2020/12

技術スタック: TypeScript/Next.js

- 旅行メディアサイト+旅行SNSアプリ[stayway media](https://stayway.jp/tourism)の開発
- 地域の食・体験のクラウドファンディングアプリ[stayway ticket](https://stayway.jp/projects)の開発

### MedUp(業務委託) 2021/01~2021/07

技術スタック: TypeScript/Next.js

- 医療機関の営業支援・顧客管理ツール[foro CRM](https://www.foro-crm.jp/)の開発

### FRAIM(業務委託) 2021/07~2025/02

技術スタック: TypeScript/React.js/Next.js/Rust/Axum/GraphQL/DynamoDB/PostgresQL

#### 契約書のオンラインエディタ[lawgue](https://lawgue.com/)の開発

フロントエンド領域で最も実装が難しいソフトウェアの1つであるエディタ。そのフロントエンドとバックエンドの機能追加と改修を担当。

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

#### ドキュメント作成ツールの開発

DnDで木構造のスクリプトを作成し、そのスクリプトを実行することによってアンケートを作成し、そのアンケートを答えることによってドキュメントを作成する。
スクリプトの要素には、ドキュメントの読み込み、スクリプトの読み込み、変数の代入、分岐、反復、テキストの挿入、入力(テキスト)、入力(選択)がある。
フロントエンドの開発の立ち上げから担当。

### クロステックマネジメント(業務委託) 2024/09~現在

技術スタック: TypeScript/Next.js/Go/Echo/PostgresQL

- オンボーディングタスク管理アプリのフロントエンドとバックエンドの開発
  - タスクのAPIの開発(一覧取得、作成、編集、削除)
- 教材アプリのフロントエンドとバックエンドの開発
  - 動画教材のVideoPlayer機能の開発
  - 教材の同期APIのリファクタリングとパフォーマンス改善
    - Bulk Operation
    - 複数ファイルのアップロードを並行処理化
