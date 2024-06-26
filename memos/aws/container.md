# Container

- [Container](#container)
  - [Flow](#flow)
    - [Network](#network)
  - [AWSリソース](#awsリソース)
    - [ECS](#ecs)
    - [Fargate](#fargate)
    - [ECS on Fargate](#ecs-on-fargate)
      - [手順](#手順)
  - [デプロイ方法](#デプロイ方法)
    - [Blue/Greenデプロイメント](#bluegreenデプロイメント)
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

#### 手順

1. コンテナからログを転送するための、CloudWatch用のインターフェース型VPCエンドポイントを作成する
2. Blue/Greenデプロイメント用のALBの設定
   1. プロダクションリスナーに紐付くターゲットグループをBlue、テストリスナーをGreen
3. ECS
   1. タスク定義
   2. ECSクラスター
   3. ECSサービス

## デプロイ方法

### Blue/Greenデプロイメント

同じアプリケーションの異なるバージョンを実行している同一の環境間で、トラフィックを移行することによってアプリケーションを解放する方法。ダウンタイムを最小限に抑える。

1. アプリケーションの新しいバージョンGreenを古いバージョンBlueと一緒に起動し、ユーザからのトラフィックは始めはBlueの方に向けられている
2. Greenのテストが成功したら、ロードバランサーによってトラフィックをBlueからGreenに切り替える
3. 問題が発生したら、トラフィックをすぐにBlueに戻すことができる
   1. ECSではALBの複数リスナーと付随するルールやターゲットグループを連携させることで実現可能になる

## Reference

- <https://github.com/suimenkathemove/notion-clone/tree/main/infrastructure>
