# クリーンアーキテクチャ

## 概要

ビジネスルールが技術に依存しないようにする。

- 依存の向きは常に内向き。ビジネスルールはFWもDBも知らない
- 内向きにできない場合は、インターフェースを内側に置いて依存を逆転させる(DIP)

### 何が嬉しい

- 「どこに何を書くか」が依存の向きで機械的に決まる
- DB、FW、UIを差し替えても、変更が外側に閉じる
- テスタビリティ
  - ビジネスルールのテストにFWなどが必要なく、集中できる

### コスト

層の数に応じて変換のためのコードが増える。
規模と寿命によっては、分離で得られるものより変換のコストが上回るので、そのときは層をまとめる。

## 依存性のルール

依存は常に外側から内側の一方向のみ。内側は外側を知らない。

```text
Entities <- Use Cases <- Interface Adapters <- Frameworks & Drivers
```

- Entities
  - ビジネスルール。
- Use Cases
  - 機能。アプリケーション固有のルールである。
- Interface Adapters
  - Controller(Handler)、Presenter、Gateway(Repositoryの実装)
  - 外側（HTTPやDB）の形式と、内側のモデルを相互に変換する
- Frameworks & Drivers
  - Webフレームワーク、DB、外部API

## 実装上の層の呼び方

実プロジェクトでは、次の4層の名前がよく使われる。

- Domain
  - 値オブジェクト、エンティティ
- Application
  - ユースケース。Repositoryのインターフェース
- Infrastructure
  - Repositoryの実装。DB、外部API、ファイルシステム
- Presentation
  - HTTP、CLIなどのUI。リクエスト/レスポンスの処理

| 原典                 | 実装上の呼び方                     |
| -------------------- | ---------------------------------- |
| Entities             | Domain                             |
| Use Cases            | Application                        |
| Interface Adapters   | Presentation + Infrastructure      |
| Frameworks & Drivers | (依存ライブラリ。コードにならない) |

4という数に決まりはない。原典の同心円も図式にすぎず、守るべきは依存の向きだけ。

### 層とディレクトリの関係

層の数は、依存の向きに規約がある境界がいくつあるかで数える。
層の数とディレクトリの数が一致しているとは限らない。

例えば、handlers/とrepository/を分けても、両者の間に向きに関する規約がなければ、
どちらも「domainの外側」という同じ位置なので、ディレクトリが3つでも2層になる。

とはいえ、実践としては層とディレクトリを1対1で対応させるべきである。

### 層の切り方の指針

「変更理由がいくつあるか（SRP）」と「そのコードの寿命」で決まる。
規模が小さく、コードの寿命も短ければ、層は少ないほうがよい。

- Domainを切るか
  - ビジネスルールが複雑なら切る価値がある
- Applicationを切るか
  - アプリ全体でUse Caseが薄くないか。
    ただし、層の有無はアプリ全体で決める。
- Infrastructureを切るか
  - 同じ操作に実装が複数あるか(Postgresとインメモリ)
  - テストや開発環境では実行したくない副作用(メール送信、決済API)があるか
- Presentationを切るか
  - 入口が複数(HTTP、CLI、キューのconsumer)ある場合はPresentationを分けると価値が出る

2層(Domain / Handler):

- ドメインロジックが薄く、処理の大半がDBの読み書きに終始する
- Use Caseを分けてもControllerからRepositoryを呼ぶだけの委譲になる場合

3層(Domain / Application / Infrastructure):

- PresentationがHTTPひとつだけで、Infrastructureと分ける動機が薄い
  - そもそもPresentationは広義のInfrastructure。
    原典でもController、Presenter、Gatewayは同じInterface Adapters層にあり、どちらも外部世界との変換という同じ役割。

## 依存性逆転(DIP)

Use CasesがDBを使いたい場合、内側にRepositoryのインターフェースを置き、実装は外側に置く。
呼び出しの向きは内 → 外だが、依存の向きはインターフェースを介して外 → 内になる。

## 境界をまたぐときのルール

- Presentation ↔ Use Case
  - ControllerはInput Portを呼ぶだけにし、結果はOutput Portか戻り値で返す
- Use Case ↔ Infrastructure
  - 内側に置いたRepositoryのインターフェースを介する(DIP)

どちらの境界でも、やり取りするデータは次のようにする。

- 層をまたぐときは、内側で定義したDTOで受け渡す
- 外側の型(ORMのエンティティ、HTTPのリクエスト/レスポンス型など)を内側に持ち込まない

### DTO（Data Transfer Object）

境界をまたいでデータを運ぶだけの構造体。

#### 定義場所

そのDTOを要求する側(内側)に置き、変換コードは外側に置く。
Repositoryのインターフェースを内側、実装を外側に置くのと同じ構図。
内側が「こういう形で欲しい」と宣言し、外側が自分の都合との差を吸収する。

```text
domain/
  user.rs
    User(エンティティ)
application/
  login/
    input.rs
      LoginInput(Use Caseが要求する入力)
    output.rs
      LoginOutput(Use Caseが返す出力)
presentation/
  http/
    login.rs
      LoginRequest(HTTPのリクエスト)
      LoginResponse(HTTPのレスポンス)
      LoginRequest -> LoginInput の変換
      LoginOutput -> LoginResponse の変換
infrastructure/
  db/
    user.rs
      UserRow(DBの行)
      UserRow -> User の変換
```

## トランザクション境界

「1Use Case = 1トランザクション」が基本。

- Use Caseが張る
  - トランザクションを抽象化したインターフェースを内側に置き、実装を外側に置く
- Presentation側(ミドルウェア)で張る
  - シンプルだが、1リクエスト = 1トランザクションに固定される

例外は、Use Case内に外部API呼び出しが混ざる場合。
トランザクションに含めると、ロックを持ったまま外部I/Oを待つことになるので外に出す。

## SOLID原則との関係

クリーンアーキテクチャは、SOLIDをコンポーネント/アーキテクチャの粒度に広げたもの。

DIPは依存の向きを内向きに保つ仕組みそのもの。
SRPは層を分ける根拠。変更理由の違うものを同居させない、という基準で層を切る。
外側を差し替えても内側を変更しないという境界の効果はOCPにあたる。

[SOLID原則](./solid.md)

## DDDとの関係

クリーンアーキテクチャは依存の向きを決めるもので、内側に何を書くかは決めていない。
DDDは、その内側をどう作るかを扱う。
組み合わせて使われることが多い。

## References

- <https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html>

## TODO

- [ ] <https://zenn.dev/sre_holdings/articles/a57f088e9ca07d>
