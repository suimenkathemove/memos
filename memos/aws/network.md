# Network

- [Network](#network)
  - [VPC, Subnets](#vpc-subnets)
    - [VPC](#vpc)
    - [VPC Endpoint](#vpc-endpoint)
      - [props](#props)
        - [serviceName(required)](#servicenamerequired)
        - [vpcId(required)](#vpcidrequired)
    - [Subnets](#subnets)
      - [Subnetを分ける理由](#subnetを分ける理由)
    - [AZ](#az)
    - [CIDR](#cidr)
    - [ネットワークのクラス](#ネットワークのクラス)
    - [routing tables](#routing-tables)
    - [security groups](#security-groups)

## VPC, Subnets

### VPC

仮想ネットワーク

### VPC Endpoint

VPC内からS3やECRなどのVPC外のAWSサービスにアクセスする場合、Internet gatewayを経由する方法と、VPCエンドポイントを経由する方法の2種類がある。

#### props

##### serviceName(required)

- インターフェース型
  - `com.amazonaws.[region].ecr.api`
    - ECR APIの呼び出しに利用される
  - `com.amazonaws.[region].ecr.dkr`
    - Dockerコマンドの呼び出しに利用される
- ゲートウェイ型
  - `com.amazonaws.[region].s3`
    - Dockerイメージの取得に利用される

##### vpcId(required)

### Subnets

分割したネットワーク

VPCのサブネットの場合はルータが無くても互いに通信できる

#### Subnetを分ける理由

- セキュリティ
  - 例えば、サービスを提供するサーバをパブリックにして、DBをプライベートにすることで、DBへの不正アクセスから保護する

### AZ

リージョン内で独立したデータセンター

### CIDR

ネットワークの範囲の表記方法。IPアドレスの数を表す。

例えば`172.31.0.0/24`の場合、2 ** (32 - 24) = 256なので、172.31.0.0 ~ 172.31.0.255になる

デフォルトVPCは`/16`、デフォルトサブネットは`/20`なので、それを目安に設定する

### ネットワークのクラス

| クラス | CIDR      |
| ------ | --------- |
| A      | /8 ~ /15  |
| B      | /16 ~ /23 |
| C      | /24 ~ /32 |

### routing tables

ネットワークの経路を設定するためのリソース

作成した時点ではVPC内のリソース間の通信しか設定されていないので、public subnet - Internet間で通信ができるように設定する

### security groups
