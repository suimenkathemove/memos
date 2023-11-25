# DDL

- [DDL](#ddl)
  - [CREATE TABLE](#create-table)
  - [DROP TABLE](#drop-table)

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
