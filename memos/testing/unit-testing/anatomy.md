# 単体テストの構造的解析

## AAAパターン

AAAパターンとは、テストケースを、準備(Arrange)、実行(Act)、確認(Assert)のフェーズで構成すること。

<https://github.com/suimenkathemove/rust_sandbox/blob/12c14c6ad3c4de764d96ee03fb5e4cf1c0a424af/unit_testing/src/calculator.rs>

統一された構造を持つことによって、テストの可読性が上がる。

| name            | description                                                                                                    |
| --------------- | -------------------------------------------------------------------------------------------------------------- |
| Arrangeフェーズ | テストケースの事前条件を満たすフェーズ。                                                                       |
| Actフェーズ     | テスト対象の振る舞いを実行させるフェーズ。                                                                     |
| Assertフェーズ  | 実行結果を確認するフェーズ。                                                                                   |
|                 | 実行結果は、戻り値の場合もあれば、テスト対象システムやその協力者オブジェクトの実行後の状態の場合もある。       |
|                 | テスト対象システムによって、想定する協力者オブジェクトのメソッドが呼び出されたことが確認対象となる場合もある。 |

テスト対象システム(System Under Test: SUT)とは、テスト対象のオブジェクトのこと。

テスト内での順番はこの順番だが、確認フェーズから書き始める選択肢もある(TDDの場合など)。

Given-When-Thenパターンもあり、AAAパターンとほぼ同じだが、非開発者にとって読みやすい。

## 単体テストにおいて回避すべきこと

### 1つのテストケース内で同じフェーズを複数用意すること

1つのテストケース内では1つの振る舞いしか検証すべきではない。

統合テストにおいて実行時間が長くなっている場合は、

- 1つのテストケース内で同じフェーズを複数含めることが効率的な場合もある。
- テスト対象の処理を行うことでシステムの状態が次の検証の事前条件に自然となる場合は、まとめた方が効率的な場合もある。

### if文の使用

if文があると理解しづらくなり保守コストが高くなるので、単体テストなのか統合テストなのかにかかわらず、分岐のない単純な流れにしなくてはならない。

## 各フェーズの適切なサイズ

### 準備フェーズ

準備フェーズは大きくなるので、関数に切り出すのが良い。
このパターンには、オブジェクトマザー(Object Mother)とテストデータビルダー(Test Data Builder)がある。

### 実行フェーズ

実行フェーズのコードが1行を超える場合は、テスト対象システムのAPIの設計に問題がある可能性がある。

### 確認フェーズ

単体テストにおける「単体」とは、1単位のコードではなく、1単位の振る舞いのことである。
戻り値のオブジェクトのフィールドの値を1つ1つ確認するのではなく、オブジェクトを比較するようにする。

## テスト対象システム

テスト対象システムとその依存の区別が簡単にできるように、テスト対象システムの変数名は`sut`にする。

## 単体テストですべきこと

プロダクションコードが何をするのか単に列挙することではなく、アプリケーションの振る舞いについてより高いレベルで描写すること。
単体テストで表現していることが非開発者にも伝わることが理想。

## テストフィクスチャ

テストフィクスチャとは、テストを実施する際に使われるオブジェクトのこと。
具体的には、テスト対象システムに引数として渡される依存の場合もあれば、データベースのデータやハードディスク上のファイルの場合もある。

テストクラスのコンストラクタやSetup属性を付けたメソッドでテストフィクスチャを準備すると以下の問題がある。

- テストケース間の結びつきが強くなる
- テストケースが読みづらくなる

準備フェーズでテストフィクスチャを準備する関数を呼び出すようにする。

ほぼすべてのテストケースで同じテストフィクスチャを使うのであればコンストラクタでもよい。

## 名前の付け方

実装の詳細に着目しているので役に立たない名前の付け方:
{テスト対象メソッド}_{事前条件}_{想定する結果}

名前を付けるときの指針

- 厳格な命名規則に縛られないようにする
- どのような検証をするのかを、ドメインに精通している非開発者に対して伝わるような名前にする

<!-- TODO: Unit Testing p.80 L5-L14 -->

テスト対象のメソッド名をテスト名に含めるべきではない。
単体テストはコードをテストしているのではなく、アプリケーションの振る舞いをテストしているからである。
ユーティリティ系のコードにはビジネスロジックが含まれていないので例外である。

`delivery_with_invalid_date_should_be_considered_invalid()`
invalid_dateとは具体的には過去の日付のことだから、
`delivery_with_past_date_should_be_considered_invalid()`
consideredは冗長なので、
`delivery_with_past_date_should_be_invalid()`
shouldを使うのはアンチパターンである。単体テストとは、1単位の振る舞いについての1つの不可分な事実を伝えるものだから。
`delivery_with_past_date_is_invalid()`
文法的に正しくすると、
`delivery_with_a_past_date_is_invalid()`

## パラメータ化テストへのリファクタリング

パラメータ化テストには、コード量と読みやすさとでトレードオフがある。
パラメータが増えることによりわかりづらくなる場合は、正常系と異常系に分ける。
それでもわかりづらい場合はやめる。