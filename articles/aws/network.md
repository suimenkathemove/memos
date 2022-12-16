# Network

- [Network](#network)
  - [VPC, Subnets](#vpc-subnets)
    - [VPC](#vpc)
    - [Subnets](#subnets)
    - [AZ](#az)
    - [CIDR](#cidr)
    - [routing tables](#routing-tables)
    - [security groups](#security-groups)

## VPC, Subnets

### VPC

仮想ネットワーク

### Subnets

分割したネットワーク

VPCのサブネットの場合はルータが無くても互いに通信できる

### AZ

リージョン内で独立したデータセンター

### CIDR

ネットワークの範囲の表記方法。IPアドレスの数を表す。

例えば`172.31.0.0/24`の場合、2 ** (32 - 24) = 256なので、172.31.0.0 ~ 172.31.0.255になる

### routing tables

ネットワークの経路を設定するためのリソース

作成した時点ではVPC内のリソース間の通信しか設定されていないので、public subnet - Internet間で通信ができるように設定する

### security groups
