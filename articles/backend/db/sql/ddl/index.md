# DDL

- [DDL](#ddl)
  - [CREATE TABLE](#create-table)
  - [DROP TABLE](#drop-table)
    - [drop behavior](#drop-behavior)
  - [ALTER TABLE](#alter-table)
  - [IF EXISTS, IF NOT EXISTS](#if-exists-if-not-exists)

## CREATE TABLE

テーブル名はスキーマ内で一意でなければならない。
列名はテーブル内で一意でなければならない。
名前には、アルファベット、アンダースコア、数字を使用できる。
予約語やスペースは、ダブルクォーテーションで囲めば使用できる。
テーブル名は集合名詞や複数形にする。
列やスキーマオブジェクトには単一の属性名を使用する。
列は慣習的な順序で並べるのがよい。

CREATE TABLE文に制約と文を詰め込むほど、SQLは速く、簡単になる。

```txt
CREATE TABLE <table name> (<table element list>)
<table element list> ::=
<table element> | <table element>, <table element list>
<table element> ::=
<column definition> | <table constraint definition>
```

## DROP TABLE

```sql
<drop table statement> ::= DROP TABLE <table name> [<drop behavior>]

<drop behavior> ::= RESTRICT | CASCADE
```

DDLはロールバックできない場合があるので、バックアップをしておく。

### drop behavior

デフォルトはRESTRICT。
RESTRICT⋯他に参照されている場合はエラーにする。
CASCADE⋯参照元のオブジェクトも削除される。

## ALTER TABLE

テーブル定義の内容を変更する。

```sql
-- 列の追加
ALTER TABLE <table name> ADD <column name> <type>

-- 列の削除
ALTER TABLE <table name> DROP <column name>
```

既存のテーブルに列を追加する場合、その列の挿入位置は通常1番後ろになる（挿入位置を指定できるDBMSもある）。

## IF EXISTS, IF NOT EXISTS

テーブルの存在を確認してから実行するかを制御する。

```sql
CREATE TABLE IF NOT EXISTS <table name>

DROP TABLE IF EXISTS <table name>
```
