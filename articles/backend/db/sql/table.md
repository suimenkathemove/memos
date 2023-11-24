# Table

## CREATE TABLE

CREATE TABLE文に制約と文を詰め込むほど、SQLは速く、簡単になる。

```txt
CREATE TABLE <table name> (<table element list>)
<table element list> ::=
<table element> | <table element>, <table element list>
<table element> ::=
<column definition> | <table constraint definition>
```

## Column Constraints 列制約

```txt
<column definition> ::=
<column name> <data type>
[<default clause>]
[<column constraint> ...]
[<constraint attributes>]

<column constraint> ::= NOT NULL
| <check constraint definition>
| <unique specification>
| <references specification>
[<constraint attributes>]
```

すべての列がデータ型を持たなければならない。
ALTER文でテーブル定義を変更しない限りデータ型は不変である。
