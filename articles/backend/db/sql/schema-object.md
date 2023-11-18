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
<domain definition> | <table definition> | <view definition> | <grant statement> | <assertion definition> | <character set definition> | <collation definition> | <translation definition>
```

### GRANT

ユーザがアクセスするスキーマオブジェクトを制限する。

### CREATE ASSERTION

スキーマ全体に対する制約を定義する。
