# Cloud SQL

## localから接続する方法

```sh
gcloud auth application-default login

./cloud-sql-proxy {myproject}:{myregion}:{myinstance} --port=PORT
```
