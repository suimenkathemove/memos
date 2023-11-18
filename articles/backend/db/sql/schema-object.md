# Schema Object

## Overview

スキーマ(schema)とは、名前空間のようなもの。

スキーマオブジェクト(schema object)とは、データベース内で定義された構造のこと。
例えば、tables, views, indexes, stored procedures, triggers, constraints, domainsなどがある。

### CREATE SCHEMA

標準SQLでは、スキーマ全体を一挙に作成する。
実際の製品では、物理ストレージの割り当てとスキーマ定義を行う。

オプションのAUTHENTICATION句では、セキュリティのためにスキーマ認証識別子を定義する。

```txt
<schema element> ::=
<domain definition>
| <table definition>
| <view definition>
| <grant statement>
| <assertion definition>
| <character set definition>
| <collation definition>
| <translation definition>
```

### CREATE DOMAIN

ドメイン型とは、既存のデータ型に対して制約を追加した型。
CREATE DOMAIN文は、ドメイン型を作成するインラインマクロである。

他のドメインを使ってドメインを定義することはできない。

```txt
<domain definition> ::=
CREATE DOMAIN <domain name> [AS] <data type>
[<default clause>]
[<domain constraint> ...]
[<collate clause>]

<domain constraint> ::=
[<constraint name definition>]
<check constraint definition> [<constraint attributes>]
```

```txt
<alter domain statement> ::=
ALTER DOMAIN <domain name> <alter domain action>

<alter domain action> ::=
<set domain default clause>
| <drop domain default clause>
| <add domain constraint definition>
| <drop domain constraint definition>
```

例えば、米国の州コードのドメインは以下のようになる。

```sql
CREATE DOMAIN StateCode AS CHAR(2)
DEFAULT '??'
CONSTRAINT valid_state_code
CHECK (VALUE IN ('AL', 'AK', 'AZ', ...));
```

### GRANT

ユーザがアクセスするスキーマオブジェクトを制限する。

### CREATE ASSERTION

スキーマ全体に対する制約を定義する。
