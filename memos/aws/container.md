# Container

- [Container](#container)
  - [Flow](#flow)
    - [Network](#network)
  - [Reference](#reference)

## Flow

1. Network
   1. VPC, Subnets
      - 障害のためにAZごとにpublic subnet, private subnetを作成する（マルチAZ構成）
        - public subnet for Ingress(ALB)
        - private subnet for app(backend, frontend, 内部ALB)
        - private subnet for DB
        - public subnet for 管理サーバーやBastion等の運用管理
   2. Internet Gateway
   3. routing tables
   4. security groups
2. Application
   - separate containers for each services.

### Network

- コンテナ
  - プライベートサブネット
    - a, c
  - ルートテーブル
  - サブネットへルート紐付け
- DB
  - プライベートサブネット
    - a, c
  - ルートテーブル
  - サブネットへルート紐付け

## Reference

- <https://github.com/suimenkathemove/monorepo-sandbox/tree/main/infrastructure>
