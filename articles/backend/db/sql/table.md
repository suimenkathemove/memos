# Table

- [Table](#table)
  - [CREATE TABLE](#create-table)
  - [Column Constraints 列制約](#column-constraints-列制約)
    - [DEFAULT句](#default句)
    - [CONSTRAINT](#constraint)
    - [Constraint Attributes](#constraint-attributes)

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

すべての列がデータ型を持たなければならない。
ALTER文でテーブル定義を変更しない限りデータ型は不変である。

列制約は、列に付与される。
行制約は、同じ行の複数の列に付与される。
テーブル制約は、複数の行に（通常は集約された形で）適用される。

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

### DEFAULT句

```txt
<default clause> ::= [CONSTRAINT <constraint name>] DEFAULT <default option>

<default option> ::= <literal> | <system value> | NULL

<system value> ::= CURRENT_DATE | CURRENT_TIME | CURRENT_TIMESTAMP | SYSTEM_USER | SESSION_USER | CURRENT_USER
```

NULLABLEの場合は、デフォルト値はNULLになる。

生成列などを指定することはできない。

### CONSTRAINT

```txt
<constraint name definition> ::= CONSTRAINT <constraint name>
```

CONSTRAINTキーワードで制約に名前を付けることができる。
これにより、エラーのデバッグ時に制約を特定しやすくなったり、エラーメッセージをより明確にすることができる。

### Constraint Attributes

```txt
<constraint attributes> ::= <constraint check time> [[NOT] DEFERRABLE] | [NOT] DEFERRABLE [<constraint check time>]

<constraint check time> ::= INITIALLY IMMEDIATE | INITIALLY DEFERRED
```

DEFERRABLEを指定すると遅延制約になり、トランザクションの実行中は制約をオフにすることができる。
DEFERRABLEを指定するだけでは遅延制約にはならず、遅延可能にするだけである。

constraint check time
INITIALLY IMMEDIATEとINITIALLY DEFERREDは、初期状態を指定する。
INITIALLY IMMEDIATEは、DML文が実行されたときに制約を施行する。
INITIALLY DEFERREDは、トランザクションのコミットの前に制約を施行する。
デフォルトはINITIALLY IMMEDIATE。
INITIALLY IMMEDIATEが指定されている場合は、NOT DEFERRABLEになる。
INITIALLY DEFERREDが指定されている場合は、DEFERRABLEを指定しなければならない。

トランザクション単位で、制約を遅延させるか、即座に施行するかを制御することもできる。

```txt
<set constraints mode statement> ::= SET CONSTRAINTS <constraint name list> {DEFERRED | IMMEDIATE}

<constraint name list> ::= ALL | <constraint name> [{<comma> <constraint name>} ...]
```
