# 31 flavor

31アイスクリームは、毎月、日替わりで違うアイスクリームを食べられることがコンセプトだった。
今では今月のフレーバーに加えて、定番、シーズン限定、地域限定などのフレーバーを提供している。
つまり、バリエーションは増えたり、変わっていく可能性がある。

値を限定したい場合、固定されている場合はメタデータを、流動的な場合はデータを用いる。

## ENUMやCHECK制約

以下の選択肢がある。

- CHECK制約
- ENUM
- DOMAIN
- UDT
- TRIGGER

### 問題点

- 選択肢を列挙するのに手間がかかる
  - INFORMATION_SCHEMAの結果セットである、`ENUM('NEW', 'IN PROGRESS', 'FIXED')`のような文字列を解析する必要がある
- 値の変更に手間がかかる
  - データをマイグレーションやETLしなければならない

### ユースケース

- 値が変更される可能性がない場合
  - 相互排他的な2つの値を指定する場合

## lookup table(参照テーブル)を作成する

### 方法

```sql
CREATE TABLE statuses (
  status VARCHAR(20) PRIMARY KEY
);

INSERT INTO statuses (status) VALUES ('NEW'), ('IN PROGRESS'), ('FIXED');

CREATE TABLE foos (
  status VARCHAR(20) REFERENCES statuses(status) ON UPDATE CASCADE
);
```

### メリット

- 選択肢の列挙が容易
- 値の変更が容易
- 廃止された値をサポートできる
  - 有効な値を`ACTIVE`、廃止された値を`INACTIVE`にすることで値を廃止することができる
