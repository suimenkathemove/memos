# sqlx-cli

[sqlx/sqlx-cli at main · launchbadge/sqlx](https://github.com/launchbadge/sqlx/tree/main/sqlx-cli)

## migration

### add

```bash
sqlx migrate add {name}
```

### run

.env

```
DATABASE_URL=postgres://{user}:{password}@{host}:{port}/{database}
```

```bash
sqlx migrate run
```
