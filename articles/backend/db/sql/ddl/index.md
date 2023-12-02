# DDL

- [DDL](#ddl)
  - [CREATE TABLE](#create-table)
  - [DROP TABLE](#drop-table)
    - [drop behavior](#drop-behavior)
  - [ALTER TABLE](#alter-table)
    - [ADD COLUMN](#add-column)
    - [ALTER COLUMN](#alter-column)
    - [ADD](#add-)
  - [TRUNCATE TABLE](#truncate-table)
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

列や列制約を、追加、削除、変更する。

```sql
ALTER TABLE <table name> <alter table action>

<alter table action> ::=
| ADD [COLUMN] <column definition>
| DROP [COLUMN] <column name> <drop behavior>
| ALTER [COLUMN] <column name> <alter column action>
| ADD <table constraint definition>
| DROP CONSTRAINT <constraint name> <drop behavior>
```

### ADD COLUMN

列を追加する場合は、その列の挿入位置は通常は最後になる（挿入位置を指定できるDBMSもある）。

### ALTER COLUMN

データ型を他の互換可能なデータ型に変更するために使うことが多い(例えば、CHAR(n)のサイズを長くすることはできるが、短くすることはできない。INTEGER型をREAL型にすることはできる)。

### ADD <table constraint definition>

テーブルに制約を追加する。
古いDBMSの場合は、追加した制約に関して既存のデータをチェックしない可能性がある。

## TRUNCATE TABLE

```sql
TRUNCATE TABLE <table name>
```

TRUNCATE TABLE文は、テーブルを初期化する。

DELETE文は記録を残すため低速だが、TRUNCATE文は記録を残さないため高速である。

## IF EXISTS, IF NOT EXISTS

テーブルの存在を確認してから実行するかを制御する。

```sql
CREATE TABLE IF NOT EXISTS <table name>

DROP TABLE IF EXISTS <table name>
```
