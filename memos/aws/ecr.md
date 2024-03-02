# ECR

- [ECR](#ecr)
  - [Overview](#overview)
  - [手順](#手順)
  - [レジストリに登録](#レジストリに登録)
  - [dockerコマンドでECRにpushするためにaws-cliでログインする方法](#dockerコマンドでecrにpushするためにaws-cliでログインする方法)
  - [MEMO](#memo)

## Overview

The encryption settings cannot be changed or disabled after the repository is created.

## 手順

1. レジストリの作成
2. レジストリへのネットワークの作成
3. コンテナのビルド
4. イメージをレジストリにpush
5. レジストリからイメージをpullし、デプロイ

## レジストリに登録

AWSでは、ECR内のイメージをAWSアカウントごとに識別しているので、IMAGE IDとして決められた形式で登録する必要がある。

## dockerコマンドでECRにpushするためにaws-cliでログインする方法

```sh
aws ecr get-login-password | docker login --username AWS --password-stdin [aws_account_id].dkr.ecr.[region].amazonaws.com
```

## MEMO

- 暗号化設定はリポジトリの作成後は変更できない。
