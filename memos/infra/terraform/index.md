# Terraform

## 基本的な流れ

1. `terraform` ブロックを書く（`required_version` / `required_providers` / backend）
2. `provider` ブロックを書く（region など）
3. `terraform init`
4. リソースを定義する
5. `terraform fmt` / `terraform validate`
6. `terraform plan`
7. `terraform apply`

## ファイルの種類

ディレクトリ内の `*.tf` は全部まとめて読まれる。
分割は人間のための整理でしかなく、ファイル名に意味はない（`terraform.tfvars` などの特別扱いを除く）。

- `versions.tf` — `terraform` ブロック。`required_version` / `required_providers`
- `providers.tf` — `provider "aws" {}` などの provider 設定
- `main.tf` — リソース定義の本体
- `variables.tf` — 入力変数の宣言
- `outputs.tf` — 出力値。他モジュールや CI から参照する
- `terraform.tfvars` / `*.auto.tfvars` — 変数の値。自動で読まれる
- `<env>.tfvars` — 環境別の値。`-var-file=` で明示的に渡す

Terraform が生成するもの:

- `.terraform.lock.hcl` — provider のバージョンロック
- `terraform.tfstate` — state
- `.terraform/` — `init` が落とした provider・モジュールのキャッシュ

### 注意点

- backend の設定も `terraform` ブロック内なので `versions.tf` に書く（`backend.tf` に分ける流儀もある）
- `tfvars` にシークレットを書かない。環境変数 `TF_VAR_<name>` や Secrets Manager 経由にする

## コマンド

- `terraform init`
    backend や provider の指定を変えたら再実行する
