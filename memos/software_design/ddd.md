# DDD

## 不変条件

そのモデルをそうたらしめている条件。
「不変」は、値が変わらないという意味ではなく、操作の前後どの時点で見ても条件が成り立っている、という意味。

- `Email`: 形式が正しい文字列である
- `Order`: 明細が1件以上ある、合計金額が上限を超えない
- 課金の`User`: 請求先が必ずある

守る場所を、value objectのコンストラクタと集約ルートのメソッドに集める。
そこを通らないと状態を変えられない形にすれば、呼び出し側で毎回チェックしなくてよくなる。

## Value Object

属性の値そのもので同一性が決まるモデル。
`String`などのプリミティブ型のままより意図を明確に表現でき、値のルール(形式や範囲)をその中に閉じ込めてカプセル化できる。

idは利用するケースが多いので、すべてvalue objectにする(find_by_idの引数など)。

## Entity

idで同一性が決まるモデル。

## Aggregate 集約

一貫性を保つ単位でentityとvalue objectをまとめたもの。
ここでの一貫性とは、1トランザクションで一緒に更新し、その中で不変条件が常に成り立つこと。
集約のうち、外から参照してよい唯一のentityを集約ルートと呼ぶ。
例えば注文は、`Order`(ルート)と`OrderItem`の集まりで1つの集約になる。
「合計金額は明細の合計と一致する」のような、複数のオブジェクトにまたがる不変条件を保つために必要。

集約を扱うときのルール:

- 外から触れるのはルートだけ。
  `OrderItem`を直接取得して書き換えず、`order.addItem(...)`のように必ずルート経由にする。
  `OrderItem`を直接書き換えられると、`addItem`の中の検査を通らずに状態が変わり、
  以下のように上限を超えた`Order`ができてしまう

  ```ts
  class Order {
    private items: OrderItem[] = []

    total(): number {
      return this.items.reduce((sum, i) => sum + i.subtotal(), 0)
    }

    addItem(item: OrderItem) {
      if (this.total() + item.subtotal() > LIMIT) {
        throw new Error('注文金額が上限を超えている')
      }
      this.items.push(item)
    }
  }

  // NG: ルートを通らないので、上限の検査を経ずに合計が変わる
  item.quantity = 10
  ```

- 1トランザクションで更新するのは1集約まで。
  同時に更新したくなったとき、両者にまたがって守るべき不変条件があるなら、集約の切り方を間違えている。
  そうではなく、一連の処理で両方が変わるだけ(注文確定 → ポイント付与)なら、切り方は正しい。
  この場合はドメインイベントを使い、注文だけを先にコミットして、ポイントは後から更新する。
  一時的に「注文はあるがポイントは未付与」の状態が見えるが、最終的には揃う(結果整合性)
- 集約をまたぐ参照は、オブジェクトではなくidで持つ。
  `Order`は`User`ではなく`UserId`を持つ。オブジェクトで持つと境界が曖昧になり、芋づる式に読み込むことになる
- repositoryは集約単位で作る。`OrderItemRepository`は作らず、`OrderRepository`が`Order`ごと読み書きする
- 大きさは、不変条件を守れる最小の範囲にする。

  集約は排他制御の単位でもあるので、大きすぎると無関係な更新まで競合する。

  同時更新では、片方の変更が消えるのを防ぐため、行に`version`列を持たせ、
  「自分が読み取ったときのversionのままなら書き込む」という条件を付けて更新する(楽観ロック)。
  このversionは行ごと、つまり集約ごとに1つしかない。
  `User`が全注文を含んでいると、`User`にversionを持たせることになるので、注文ごとにversionを分けられない。

  ```ts
  // NG: versionを持つのは集約ルートのUserの1行だけなので、注文ごとに分けられない
  class User {
    version: number
    orders: Order[] // 全注文がこの中にある
  }

  // 操作A: 注文1を編集。version 5のUserを読み取る
  const user = userRepository.findById(userId) // version === 5
  user.orders.find((o) => o.id === '注文1').changeQuantity(3)
  userRepository.update(user)
  // update users set ..., version = 6 where id = ? and version = 5 → 成功

  // 操作B: 注文2を編集。Aのコミット前に読み取ったので、同じくversion 5
  // update users set ..., version = 6 where id = ? and version = 5 → 0件更新で失敗
  ```

  `Order`が独立した集約なら、`orders`テーブルの別々の行、別々のversionを更新するのでぶつからない。

  ```ts
  // OK: 注文ごとに行が分かれるので、注文ごとにversionを持てる
  class Order {
    version: number
    userId: UserId // 集約をまたぐ参照はidで持つ
    items: OrderItem[]
  }

  // 操作A: 注文1を編集
  const order1 = orderRepository.findById('注文1') // version === 5
  order1.changeQuantity(3)
  orderRepository.update(order1)
  // update orders set ..., version = 6 where id = '注文1' and version = 5 → 成功

  // 操作B: 注文2を編集。別の行なので影響を受けない
  const order2 = orderRepository.findById('注文2') // version === 2
  order2.changeQuantity(1)
  orderRepository.update(order2)
  // update orders set ..., version = 3 where id = '注文2' and version = 2 → 成功
  ```

  逆に小さすぎると、`Order`と`OrderItem`を分けた場合の「合計金額 = 明細の合計」のように、
  一緒に守るべき不変条件が2つの集約にまたがり、1トランザクションで守れなくなる。

## Domain Service

特定の1つのentityやvalue objectに属さないドメインロジックを置く。
例えば「メールアドレスが他のユーザーと重複していないか」の判定は、
自分以外の全ユーザーを見ないと決められないので、1つの`User`のメソッドにはできない。
置き場に困ったものを何でも入れると手続き的になるので、まずentity/value objectに置けないかを検討する。

## Domain Event

ドメインで起きた出来事を表すモデル。
`OrderPlaced`(注文された)のように、過去形で名前を付ける。
起きた事実なので、作られたあとは変更しない。

嬉しいのは、発行側が受け手を知らずに済むこと。
受け手が増えても発行側のコードは変わらないので、発行側の処理に受け手側の都合が混ざらない。

### 集約をまたぐ更新: 注文確定 → ポイント付与

1トランザクションで更新するのは1集約までなので、
「注文が確定したらポイントを付与する」は、`Order`の更新時に`OrderPlaced`を発行し、
ポイント側がそれを受けて自分の集約を更新する。

```ts
// NG: 注文がポイントを直接知っている。受け手が増えるたびにここが変わる
class PlaceOrderService {
  execute(input: Input) {
    const order = Order.place(input)
    this.orderRepository.create(order)
    this.pointService.grant(order.userId, order.total())
  }
}
```

```ts
// OK: 注文は「注文された」という事実を発行するだけ
class Order {
  static place(input: Input): Order {
    const order = new Order(input)
    order.addEvent(new OrderPlaced(order.id, order.userId, order.total()))
    return order
  }
}

// ポイント側は、注文側から呼ばれずに自分の集約を更新する
class GrantPointOnOrderPlaced {
  handle(event: OrderPlaced) {
    const point = this.pointRepository.findByUserId(event.userId)
    point.grant(event.total)
    this.pointRepository.update(point)
  }
}
```

`addEvent`はイベントを集約に溜めるだけで、その時点では`handle`は実行されない。
集約の永続化が成功したあとにapplication serviceがイベントを取り出して購読側に渡し、そこで`handle`が実行される。

```ts
class PlaceOrderService {
  execute(input: Input) {
    const order = Order.place(input)
    this.orderRepository.create(order)
    this.eventPublisher.publish(order.pullEvents())
  }
}
```

### コンテキストをまたぐ連携: ユーザー登録 → 請求先の作成

認証が課金を直接呼ばず、課金が`UserRegistered`を受けて`Customer`を作れば、認証側は課金の存在を知らずに済む。
同じ人間を、認証側は`User`、課金側は`Customer`という別のモデルとして持ち、その間をイベントでつなぐ。

```ts
// NG: 認証が課金を直接知っている。課金の仕様が変わると認証側も変わる
class RegisterUserService {
  execute(input: Input) {
    const user = User.register(input)
    this.userRepository.create(user)
    this.billingService.createCustomer(user.id, user.email)
  }
}
```

```ts
// OK: 認証は「登録された」という事実を発行するだけ
class User {
  static register(input: Input): User {
    const user = new User(input)
    user.addEvent(new UserRegistered(user.id, user.email))
    return user
  }
}

// 課金側は、認証のモデルではなく自分のモデルを作る
class CreateCustomerOnUserRegistered {
  handle(event: UserRegistered) {
    const customer = Customer.create(event.userId, event.email)
    this.customerRepository.create(customer)
  }
}
```

このあと「登録時にメールを送る」「登録時に分析基盤へ記録する」が増えても、購読側が増えるだけで認証側のコードは変わらない。

### 同期で処理するか非同期にするかは別の判断

イベントを同期的に処理するか、キューを挟んで非同期にするかは、上のどちらの形とも独立に決める。
非同期にすると即座には一致しない(結果整合性)ので、それを許せる場面かを確認する。

## Repository

Repository層といったり、Infrastructure層といったりする。

mutationは、createとupdateを分ける。saveでまとめない。updateのinputの属性はオプショナルの場合があるため。

## Application Service

UseCase層。

## Controller

HTTPなどのインターフェースとapplication serviceの境界。
リクエストをapplication serviceの入力に変換し、結果をレスポンスに変換するだけにして、ドメインロジックは持たせない。

バリデーションは、判定に必要な知識で置き場所が決まる。

- controller: リクエストの形式(必須項目の有無、型、JSONの構造)。ドメインを知らなくても判定できるもの
- value object: 値そのもののルール(メールアドレスの形式、数量が正、文字数の上限)。ここで弾けば以降は常に妥当な値
- domain service / application service: 他のデータを見ないと判定できないもの(重複チェック、在庫の残数)

値のルールをcontrollerに書くと、別の入口(バッチ、他のAPI)から入ってきたときに同じ検査が漏れる。

## DI

上位の層が下位の実装ではなくインターフェースに依存するようにするための仕組み。
application serviceはrepositoryのインターフェースだけを知り、実装(DBアクセス)は起動時に注入する。
これによりドメイン側がインフラに依存しなくなり、テストではモックに差し替えられる。

## 境界づけられたコンテキスト

モデルが意味を持つ範囲。その境界の外では、同じ言葉でも指すものが変わる。
例えば「ユーザー」は、認証の文脈ではログイン情報を持つものだが、課金の文脈では請求先を持つものになる。

### 1つのモデルにまとめると壊れる

複数のコンテキストのモデルを1つにまとめると、どちらの都合でも壊れるモデルになる。
壊れるのは属性が増えるからではなく、以下がコンテキストごとに違うのに、モデルには1組しか持てないから。

- 不変条件
  認証は「請求先なしでもユーザーは存在してよい」、課金は「請求先のないユーザーは請求できない」。
  コンストラクタで請求先を必須にするとサインアップ直後のユーザーが作れず、
  かといってnullableにすると「請求先があるユーザー」を型で表現できない。
  結果、生成時に1度保証できたはずのチェックが、課金側の呼び出し箇所すべてに散らばってしまう。
- ライフサイクル
  退会時、認証情報は破棄したいが請求履歴の参照先は残したい。
  分かれていれば認証側は行ごと消せて「テーブルにある = 有効なユーザー」が保てる。
  同一エンティティだと請求履歴が参照しているので消せず、退会フラグを立てて残すしかない。
  すると認証のクエリすべてに退会済みの除外が付き回り、1箇所忘れると退会者がログインできてしまう。
- 変更理由
  認証は認証方式の追加(SSO、MFA)で変わり、課金は料金体系や税率の変更で変わる。
  同居していると課金の仕様変更で認証のテストが落ち、リリースのたびに無関係な側の確認が要る。

### 境界を引くと何が嬉しいか

- 用語が曖昧にならない: 1つのコンテキストの中では、言葉とモデルが1対1で対応する(ユビキタス言語)。
  課金の中で「ユーザー」と言ったら必ず`billing.User`を指し、認証の`User`は出てこない。
- 結合が弱くなる: コンテキストをまたぐときは、同じモデルを共有せず、変換する。
  課金は認証の`User`を受け取らず、`UserId`だけ受け取って自分の`Customer`を引く。
  両方から同じ`User`クラスをimportすると、分けたつもりでも1つのモデルを共有した状態に戻る(具体例は「境界はimportで消える」)。
- 分担しやすい: 境界はチームの分割単位やデプロイの単位と揃いやすい。
  認証と課金が別チームなら、DBテーブルも分け、変更は互いのAPI経由にする。

#### 境界はimportで消える

ディレクトリを分けても、片方がもう片方のモデルをimportした時点で1つのモデルの共有に戻る。

```ts
// billing/invoice-service.ts
import { User } from "../auth/user"; // ← ここで境界が消える

export class InvoiceService {
  issue(user: User, amount: Money): Invoice {
    // 課金が欲しいのは請求先だが User にはない
    // → auth の User に billingAddress を生やしたくなる
    return Invoice.create(user.id, amount);
  }
}
```

課金が請求先を要求すると`auth.User`に`billingAddress`が生える。
認証は請求先なしでユーザーを作れないといけないので`billingAddress?: Address`になり、課金側は呼び出しのたびにnullチェックすることになる。
課金の都合で`auth/user.ts`を触るので、認証のテストも落ちる。

識別子だけを渡し、課金は自分のモデルを持つ。

```ts
// shared/user-id.ts 振る舞いを持たない識別子だけは共有してよい
export type UserId = string & { readonly __brand: "UserId" };

// auth/user.ts
export class User {
  constructor(
    readonly id: UserId,
    readonly email: string,
    readonly passwordHash: string,
  ) {}
}

// billing/customer.ts
export class Customer {
  private constructor(
    readonly userId: UserId,
    readonly billingAddress: Address, // 必須にできる
  ) {}

  static register(userId: UserId, address: Address): Customer {
    return new Customer(userId, address);
  }
}

// billing/invoice-service.ts auth をimportしない
export class InvoiceService {
  constructor(private readonly customers: CustomerRepository) {}

  async issue(userId: UserId, amount: Money): Promise<Invoice> {
    const customer = await this.customers.findByUserId(userId);
    if (!customer) throw new Error("customer not registered");
    // ここから先、請求先は必ず存在する
    return Invoice.create(customer, amount);
  }
}
```

`UserId`は値のコピーなので、退会時に認証側が`User`の行を消しても課金側の`Customer`は残せる。

漏れは機械的に止める。`no-restricted-imports`で隣のコンテキストへのimportを禁止しておく。

```json
// billing/.eslintrc.json
{
  "rules": {
    "no-restricted-imports": [
      "error",
      {
        "patterns": [
          {
            "group": ["**/auth/**"],
            "message": "auth のモデルを直接使わず UserId 経由にする"
          }
        ]
      }
    ]
  }
}
```

### 腐敗防止層 ACL

他のコンテキストのモデルを、自分のコンテキストのモデルに変換する層。ACL(Anti-Corruption Layer)。
相手の都合が自分のドメインモデルに侵入するのを防ぐために置く。

外部APIやレガシーシステムの都合(スネークケースのJSON、意味の違う`status`コード、nullだらけの項目)が
そのまま入ってくると、自分のドメインモデルがその形に引きずられる。
変換をこの層に閉じ込めれば、相手の仕様変更の影響が受け口の1箇所で止まる。

インターフェースは課金側が自分の言葉で定義し、変換の実装だけを`acl/`に置く。
repositoryと同じで、課金のドメインは相手を知らず、実装を注入される側になる。

```ts
// billing/application/auth-gateway.ts 課金が欲しい形を課金の言葉で宣言する
export interface AuthGateway {
  fetchContact(userId: UserId): Promise<BillingContact>; // 課金側の型
}

// billing/acl/auth-gateway-impl.ts auth を知る唯一の場所
export class AuthGatewayImpl implements AuthGateway {
  constructor(private readonly authApi: AuthApi) {}

  async fetchContact(userId: UserId): Promise<BillingContact> {
    const res = await this.authApi.getUser(userId); // auth の形
    return new BillingContact(res.email); // 課金の形に変換
  }
}
```

import禁止の例外はこのファイルだけにする。
`acl/`以外から`auth`を触れないので、変換を迂回した参照が増えない。

```json
// billing/.eslintrc.json
{
  "overrides": [
    {
      "files": ["acl/**"],
      "rules": { "no-restricted-imports": "off" }
    }
  ]
}
```

### コンテキストとディレクトリ構成

境界づけられたコンテキストは、ディレクトリ構成にも現れる。
層(domain/, application/, ...)より先にコンテキストで切るほうが、変更が一箇所に閉じる。
詳細は[コード配置](./code_layout.md)。

## Links

- <https://github.com/nrslib/itddd>
- <https://github.com/j5ik2o/rust-ddd-rest-api-template>
