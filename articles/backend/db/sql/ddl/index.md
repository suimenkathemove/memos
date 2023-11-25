# DDL

- [DDL](#ddl)
  - [CREATE TABLE](#create-table)
  - [DROP TABLE](#drop-table)
  - [ALTER TABLE](#alter-table)
  - [IF EXISTS, IF NOT EXISTS](#if-exists-if-not-exists)

## CREATE TABLE

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
DROP TABLE <table name>
```

DDLはロールバックできない場合があるので、バックアップをしておく。

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
