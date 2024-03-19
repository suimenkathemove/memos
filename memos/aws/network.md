# Network

- [Network](#network)
  - [リージョン(region)](#リージョンregion)
  - [アベイラビリティゾーン(Availability Zone, AZ)](#アベイラビリティゾーンavailability-zone-az)
  - [VPC](#vpc)
  - [Subnets](#subnets)
  - [Internet Gateway](#internet-gateway)
  - [Route Tables](#route-tables)
    - [default gatewayの設定](#default-gatewayの設定)
  - [セキュリティグループ(security groups)](#セキュリティグループsecurity-groups)
  - [VPC Endpoint](#vpc-endpoint)
    - [serviceName(required)](#servicenamerequired)
  - [Elastic IP](#elastic-ip)

## リージョン(region)

## アベイラビリティゾーン(Availability Zone, AZ)

リージョン内のデータセンターをグループ化したもの。
サブネットは、別々のavailability zoneにあっても通信はできるが、距離による遅延が増加したり、通信費用が大きくなる可能性がある。

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

### default gatewayの設定

VPCの作成時にデフォルトのルートテーブルが作成される。

| destination | target |
| ----------- | ------ |
| 10.0.0.0/16 | local  |

これではVPC内のリソース間の通信しかできないので、インターネットと接続するために、`10.0.0.0/16`以外はIGWに転送するという設定をする。
具体的には、`0.0.0.0/0`はIGWに転送するという設定を追加する。
`0.0.0.0/0`はすべてのIPアドレス範囲を示している。つまり、デフォルトの転送先として使うことができる。
このデフォルトの転送先をdefault gatewayという。

手順

1. パブリックサブネット用のルートテーブルを作成する
2. 作成したルートテーブルをパブリックサブネットに割り当てる
3. 作成したルートテーブルに、IGWをdefault gatewayにするルートを追加する

## セキュリティグループ(security groups)

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

## Elastic IP

パブリックIPアドレスを固定化する。
