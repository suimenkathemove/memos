# Container

- [Container](#container)
  - [Flow](#flow)
    - [Network](#network)
  - [AWSリソース](#awsリソース)
    - [ECS](#ecs)
    - [Fargate](#fargate)
    - [ECS on Fargate](#ecs-on-fargate)
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

## AWSリソース

### ECS

ECSは、稼働するコンテナのスケールや死活監視等の管理をするコントロールプレーンである。

### Fargate

サーバーレスコンピューティングエンジン
コンテナが稼働するリソース環境を提供するデータプレーン

### ECS on Fargate

ECRにコンテナイメージをpushした後、そのイメージをデプロイするようにECS上のコンテナ「定義」をアップデートする。
指示を受けたECSは、コンテナ定義内で指定されたイメージを参照し、Fargateに対してデプロイを指示する。
指示を受けたFargateは、コンテナのグループ(タスク)ごとにFirecrackerというマイクロVMを起動させ、その上でコンテナが稼働する。

## Reference

- <https://github.com/suimenkathemove/monorepo-sandbox/tree/main/infrastructure>
