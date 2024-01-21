# Column Constraints 列制約

- [Column Constraints 列制約](#column-constraints-列制約)
  - [DEFAULT句](#default句)
  - [NOT NULL](#not-null)
  - [UNIQUE](#unique)
  - [CHECK](#check)
  - [PRIMARY KEY](#primary-key)
    - [Simple Primary Key](#simple-primary-key)
    - [Composite Primary Key](#composite-primary-key)
  - [FOREIGN KEY](#foreign-key)
  - [CONSTRAINT](#constraint)
  - [Constraint Attributes](#constraint-attributes)

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

## DEFAULT句

```txt
<default clause> ::= [CONSTRAINT <constraint name>] DEFAULT <default option>

<default option> ::= <literal> | <system value> | NULL

<system value> ::= CURRENT_DATE | CURRENT_TIME | CURRENT_TIMESTAMP | SYSTEM_USER | SESSION_USER | CURRENT_USER
```

NULLABLEの場合は、デフォルト値はNULLになる。

生成列などを指定することはできない。

## NOT NULL

## UNIQUE

`NULL != NULL`なので、NULLの重複は許される。

## CHECK

## PRIMARY KEY

PRIMARY KEY制約は、行を識別するための値を持つ列に指定する。
テーブル定義に必須で、1つだけ指定する。
PRIMARY KEY制約は、NOT NULL制約、かつ、UNIQUE制約である。

PRIMARY KEY制約を指定する方法には、Simple Primary KeyとComposite Primary Keyの2つがある。

### Simple Primary Key

```sql
CREATE TABLE users (
  id UUID PRIMARY KEY
)
```

### Composite Primary Key

```sql
CREATE TABLE relationships (
  id_1 UUID,
  id_2 UUID,
  -- 最後に指定する
  PRIMARY KEY (id_1, id_2)
)
```

## FOREIGN KEY

FOREIGN KEY制約は、外部キー(参照先の列を指す参照元の列)に指定することで、参照整合性が壊れるのを防ぐ。

```sql
CREATE TABLE tables (
  column type REFERENCES referenced_tables (column)
)

CREATE TABLE tables (
  -- 最後に指定する
  FOREIGN KEY (<column>) REFERENCES referenced_tables (<column>)
)
```

## CONSTRAINT

```txt
<constraint name definition> ::= CONSTRAINT <constraint name>
```

CONSTRAINTキーワードで制約に名前を付けることができる。
これにより、エラーのデバッグ時に制約を特定しやすくなったり、エラーメッセージをより明確にすることができる。
制約を削除する際に特定しやすくなる。

## Constraint Attributes

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
