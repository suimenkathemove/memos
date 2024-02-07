# UPDATE Statement

## 値がNULLの場合は更新しないようにする方法

COALESCE関数を使う。

```sql
UPDATE users SET name = COALESCE($2, name) WHERE id = $1
```
