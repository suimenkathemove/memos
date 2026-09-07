# terraform state

Terraformが管理しているリソースのスナップショット。
デフォルトでは `terraform.tfstate` に保存される。

## 注意点

- **state にはシークレットが平文で入る**（RDS のパスワードなど）。Git にコミットしない。
- 手で編集しない。操作は CLI 経由で行う。

