# SOLID原則

オブジェクト指向設計の5原則。
特定のアーキテクチャに紐づくものではなく、クラス/モジュールの粒度で使う一般原則。

## SRP(Single Responsibility Principle) 単一責任の原則

モジュールが変更される理由は1つだけであるべき。

「1つのことだけをする」ではなく、「変更を要求するアクターが1つ」という意味。
アクターとは、その変更を言い出す人や部署のこと。コードを書く側ではなく、依頼する側を指す。
別々の理由で変わるコードを同じ場所に置かない。

行数や複雑さではなく、アクターを数える。
営業が割引ルールを変えたい、フロント担当がレスポンスに項目を足したい、インフラ担当がDBを移したい、なら3つ。
アクターが違うものは独立に変わる。混ぜておくと、一方のための変更が、無関係な他方を壊す。

例えば、経理部が使う給与計算と人事部が使う勤怠レポートが、同じ`regularHours()`を共有しているとする。

```ts
class Employee {
  calculatePay() { return this.regularHours() * this.rate; } // 経理部
  reportHours() { return this.regularHours(); }              // 人事部

  private regularHours() { return Math.min(this.hours, 40); }
}
```

経理部が「残業代の基準に有給を含めたい」と言い、`regularHours()`に`this.paidLeaveHours`を足すと、依頼していない人事部のレポートも同時に変わる。
呼び出し側が悪いのではなく、変更理由の違う2つが1つの実装を共有しているのが原因。
分けると`Math.min(..., 40)`が2箇所に重複するが、これはDRY違反ではない。
由来する仕様が別なので、片方だけ変わる日が来る。

逆に、1つの部署だけが使う管理画面のCRUDはアクターが実質1つで、カラム追加と画面の項目追加とレスポンス変更が常に同時に起きる。
分けても結局すべてを同時に直すことになり、変更のたびに触る範囲は狭くならない。

```ts
// NG: アクターは運用部の1つだけなのに、操作ごとに分けている
class UserCreateService { create(input: UserInput) { /* ... */ } }
class UserUpdateService { update(id: Id, input: UserInput) { /* ... */ } }
class UserDeleteService { delete(id: Id) { /* ... */ } }

// OK: アクターが1つなので、1つにまとめる
class UserAdminService {
  create(input: UserInput) { /* ... */ }
  update(id: Id, input: UserInput) { /* ... */ }
  delete(id: Id) { /* ... */ }
}
```

## OCP(Open/Closed Principle) 開放閉鎖の原則

拡張に対して開いていて、修正に対して閉じているべき。

機能を追加するときに既存のコードを書き換えるのではなく、新しい実装を足すだけで済む形にする。抽象への依存で実現する。

次のコードは、支払い方法が増えるたびに`switch`に手を入れることになり、修正に対して開いている。
同じ`switch`は`fee`だけでなく、表示名や締日の計算にも散らばる。
支払い方法を1つ足すたびに、それらをすべて探して直すことになり、漏らすと既存の支払い方法まで動かなくなる。

```ts
function fee(payment: Payment): Money {
  switch (payment.kind) {
    case "credit": return payment.amount * 0.03;
    case "bank":   return 200;
    // PayPayを足すには、この関数を書き換えるしかない
  }
}
```

抽象に依存させると、支払い方法ごとの分岐がクラスの中に集まる。
追加は新しいクラス1つで完結し、既存のクラスと呼び出し側には触れないので、動いていたものを壊さない。

```ts
interface Payment {
  fee(): Money;
}

class CreditCard implements Payment { fee() { return this.amount * 0.03; } }
class BankTransfer implements Payment { fee() { return 200; } }
class PayPay implements Payment { fee() { return 0; } } // 追加はこれだけ
```

ただし、クラスに分けた時点で「支払い方法が増える」という軸を選んだことになり、別の軸の変更には弱くなる。
「手数料を国ごとに変えたい」が来ると、`CreditCard`・`BankTransfer`・`PayPay`のすべての`fee`に国別の分岐を入れることになる。
`switch`のままなら`fee`という1つの関数を直すだけで済んだ。

```ts
// クラスに分けた場合: すべてのクラスに同じ国別分岐が増える
class CreditCard implements Payment {
  fee(country: Country) {
    return country === "JP" ? this.amount * 0.03 : this.amount * 0.05;
  }
}
class BankTransfer implements Payment {
  fee(country: Country) {
    return country === "JP" ? 200 : 1500;
  }
}
class PayPay implements Payment {
  fee(country: Country) {
    return country === "JP" ? 0 : 100;
  }
}

// switchのままの場合: この関数1つで済む
function fee(payment: Payment, country: Country): Money {
  switch (payment.kind) {
    case "credit": return country === "JP" ? payment.amount * 0.03 : payment.amount * 0.05;
    case "bank":   return country === "JP" ? 200 : 1500;
    case "paypay": return country === "JP" ? 0 : 100;
  }
}
```

## LSP(Liskov Substitution Principle) リスコフの置換の原則

派生型は、基底型と置き換えても正しく動作しなければならない。

基底型を受け取る呼び出し側に派生型を渡しても正しく動くには、コンパイルが通るだけでは足りない。
派生型は、基底型が呼び出し側と交わしている契約も引き継ぐ必要がある。

- 事前条件: 呼び出す前に満たすべき条件。派生型で厳しくしてはならない
  （基底型が負の数も受け取るのに、派生型だけ0以上を要求して例外を投げる、など）
- 事後条件: 呼び出した後に成り立つ結果。派生型で緩めてはならない
  （基底型が「高さは変わらない」と保証しているのに、派生型では変わってしまう、など）

破ると、呼び出し側は型ごとの分岐を書いて回避しないといけなくなる。

例えば`Rectangle`を継承した`Square`は、型は合うが契約を破る。

```ts
class Rectangle {
  constructor(protected width: number, protected height: number) {}
  setWidth(w: number) { this.width = w; }
  setHeight(h: number) { this.height = h; }
  area() { return this.width * this.height; }
}

class Square extends Rectangle {
  // NG: 幅を変えるメソッドで高さも変えている。基底型にはない事後条件を持ち込んでいる
  setWidth(w: number) { this.width = w; this.height = w; }
  setHeight(h: number) { this.width = h; this.height = h; }
}
```

`Rectangle`を受け取る次の関数は、`setWidth`が高さを変えないことを前提に20を期待している。
`Square`を渡すと`setWidth(5)`で高さも5になり、続く`setHeight(4)`で幅も4になるので、16が返る。

```ts
function areaOf(r: Rectangle): number {
  r.setWidth(5);
  r.setHeight(4);
  return r.area(); // Rectangleなら20、Squareなら16
}
```

呼び出し側は`if (shape instanceof Square)`を書く羽目になり、多態の意味がなくなる。

契約を破っているのは`setWidth`・`setHeight`なので、次のコードではこれらを持たせない。
値を変えずに新しいインスタンスを返す形にすると、`Square`は`Rectangle`を継承する必要がなくなり、共通の抽象は`area`だけになる。

```ts
interface Shape {
  area(): number;
}

class Rectangle implements Shape {
  constructor(readonly width: number, readonly height: number) {}
  withWidth(w: number) { return new Rectangle(w, this.height); }
  area() { return this.width * this.height; }
}

class Square implements Shape {
  constructor(readonly side: number) {}
  withSide(s: number) { return new Square(s); }
  area() { return this.side * this.side; }
}
```

「幅だけを変える」は`Rectangle`にしかない操作なので、`Shape`には現れない。
`Shape`として扱うコードは`area`しか呼ばず、どちらを渡しても正しく動く。

## ISP(Interface Segregation Principle) インターフェース分離の原則

インターフェースの利用者に、自分が使わないメソッドへの依存を強制してはならない。

大きなインターフェースを、利用者ごとの小さなインターフェースに分ける。
利用者は自分が使うものだけに依存する。

```ts
// NG: FAX機能のないプリンタも、fax()を実装して例外を投げるしかない
interface MultiFunctionDevice {
  print(doc: Document): void;
  scan(): Document;
  fax(doc: Document, to: string): void;
}

// OK: 利用者ごとに分ける。実装クラスは必要なものだけを実装する
interface Printer { print(doc: Document): void; }
interface Scanner { scan(): Document; }
interface Fax { fax(doc: Document, to: string): void; }
```

実装クラスは、持っていない機能のために例外を投げるメソッドを用意しなくてよくなる。
呼べないメソッドが型に載らないので、LSP違反も避けられる。

呼び出し側も、`print`しか呼ばない関数は`Printer`だけを引数に取ればよくなる。
シグネチャがその関数のすることを正しく表し、`Scanner`や`Fax`が変わっても影響を受けない。

## DIP(Dependency Inversion Principle) 依存性逆転の原則

モジュールの境界では、上位が下位に依存してはならない。両方が抽象に依存すべき。

上位は業務ルールを持つ側(usecase)、下位はそれを実現する技術の側(DBアクセスやHTTPクライアント)を指す。

抽象は上位側(利用する側)が定義する。
これにより、呼び出しの向きと依存の向きを逆にできる。

```ts
// NG: ユースケースがPostgresという具体的な技術を知っている
import { PostgresUserRepository } from "../infra/postgres";

class RegisterUser {
  constructor(private repo: PostgresUserRepository) {}
}

// OK: 抽象はユースケース側で定義し、infra側がそれを実装する
// usecase/user-repository.ts
interface UserRepository {
  save(user: User): Promise<void>;
}

// usecase/register-user.ts
class RegisterUser {
  constructor(private repo: UserRepository) {}
}

// infra/postgres-user-repository.ts
class PostgresUserRepository implements UserRepository { /* ... */ }
```

`RegisterUser`は`infra`を一切importしない。
importの向きがinfraからusecaseへの一方向になり、DBを差し替えてもusecaseは変わらない。

ただし、すべての依存に適用するものではない。
適用する価値があるのは、境界を越える依存に限られる:

- 差し替える可能性のあるもの(DB、外部API、メール送信)
- テストで置き換えたいもの
- 上位と変更理由が違うもの(業務ルールで変わるusecaseと、ライブラリ更新やスキーマ変更で変わるinfra)

3つ目はSRPと同じ判断基準を、クラスではなくモジュールの境界に当てはめたもの。
変更理由が違うとき、SRPはクラスを分ける。
DIPはその境界を抽象で切り、依存の向きを上位から下位へ向かないように固定する。

### DIとの違い

DIP(Dependency Inversion Principle)とDI(Dependency Injection)は別のレイヤーの話。

- DIP: 設計の方針。誰が誰を知っているか(コンパイル時の依存の向き)を決める。
  肝は抽象の所有者で、インターフェースは利用する側が定義する。
  満たしているかはimport文を見れば分かる
- DI: 実装のテクニック。実行時に具体的な実装をどう渡すかの話。
  自分でnewせず、コンストラクタ引数などで外から受け取る

両者は独立しているので、DIしていてもDIP違反になりうる。

```ts
// DIだけ(DIP違反): 外から受け取っているが、usecaseが具象を知っている
class RegisterUser {
  constructor(private repo: PostgresUserRepository) {}
}

// DIPあり: 抽象に依存し、その抽象はusecase側が定義している
class RegisterUser {
  constructor(private repo: UserRepository) {}
}
```

DIPが目的、DIはそれを実行時に成立させる手段。
DIコンテナはさらにその下で、DIの配線を自動化する道具にすぎない。
