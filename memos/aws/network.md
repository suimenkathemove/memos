# Network

- [Network](#network)
  - [AZ](#az)
  - [VPC](#vpc)
  - [Subnets](#subnets)
  - [Internet Gateway](#internet-gateway)
  - [Route Tables](#route-tables)
  - [security groups](#security-groups)
  - [VPC Endpoint](#vpc-endpoint)
    - [serviceName(required)](#servicenamerequired)

## AZ

リージョン内で独立したデータセンター。

## VPC

プライベートな仮想ネットワーク空間。

CIDRブロックは基本的に`10.0.0.0/16`に設定する。

## Subnets

分割したネットワーク。

- Subnetを分ける理由
  - 耐障害性
    - 1つのサブネットが障害を起こしても、他のサブネットに影響が出にくくなる。
  - セキュリティ
    - 例えば、サービスを提供するサーバをパブリックにして、DBをプライベートにすることで、DBへの不正アクセスから保護する

CIDRブロックのprefixは基本的に`/24`に設定する。

VPCのサブネットの場合はルータが無くても互いに通信できる。

## Internet Gateway

サブネットをインターネットに接続するために使う。

## Route Tables

「宛先IPがいくつのときには、どのネットワークに送るべきか」という設定のことであり、ネットワーク同士を接続する。

ネットワークにデータを送るためにはルーティングの設定が必要である。

ルータにはルートテーブルを設定しておく必要がある。

ルートテーブルの設定

| destination(宛先IP) | target(ネットワークの入り口となるルータ) |
| ------------------- | ---------------------------------------- |
| ...                 | ...                                      |

サブネット単体でサブネット間の通信自体はできるが、ルートテーブルをサブネットに関連付けることで、サブネット間の通信をカスタマイズすることができる。

VPC内には、内部的にサブネットやIGW間にルータがある。

作成した時点ではVPC内のリソース間の通信しか設定されていないので、public subnet - Internet間で通信ができるように設定する。

## security groups

## VPC Endpoint

VPC内からS3やECRなどのVPC外のAWSサービスにアクセスする場合、Internet gatewayを経由する方法と、VPCエンドポイントを経由する方法の2種類がある。

### serviceName(required)

- インターフェース型
  - `com.amazonaws.[region].ecr.api`
    - ECR APIの呼び出しに利用される
  - `com.amazonaws.[region].ecr.dkr`
    - Dockerコマンドの呼び出しに利用される
- ゲートウェイ型
  - `com.amazonaws.[region].s3`
    - Dockerイメージの取得に利用される
