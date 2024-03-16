# EC2

- [EC2](#ec2)
  - [props](#props)
    - [AMI](#ami)
      - [Amazon Linux](#amazon-linux)
    - [インスタンスタイプ](#インスタンスタイプ)
    - [associatePublicIpAddress](#associatepublicipaddress)
  - [キーペア](#キーペア)
    - [キーペアを作成し、紐付ける](#キーペアを作成し紐付ける)
  - [ステータスチェック](#ステータスチェック)
  - [課金](#課金)

インスタンスには、サブネットで利用可能なプライベートIPアドレスを割り当てる。
パブリックサーバの場合は、パブリックIPアドレスも割り当てる。

## props

### AMI

OSがインストールされて、初期アカウントの設定までが済んだもの。

#### Amazon Linux

AWSが提供しているLinux distribution。
Red Hat Enterprise LinuxをベースとしたAmazon Linux 2と、FedoraをベースとしたAmazon Linux 2023がある。

### インスタンスタイプ

仮想マシンのスペック。

- t2.micro

### associatePublicIpAddress

起動のたびにランダムなIPアドレスを割り当てる。

## キーペア

インスタンスにログインするための鍵。

| key                          | value |
| ---------------------------- | ----- |
| キーペアのタイプ             | RSA   |
| プライベートキーファイル形式 | .pem  |

1つのキーペアを複数のインスタンスに対して使うことができる。

### キーペアを作成し、紐付ける

```sh
# キーペアを作成する
aws ec2 create-key-pair --key-name MyKeyPair --query 'KeyMaterial' --output text > MyKeyPair.pem
```

```ts
// キーペアをインスタンスに紐付ける
new CfnInstance(this, instanceId, {
  // キーペア名を指定する
  keyName: "MyKeyPair",
});
```

```sh
# インスタンスにログインする
ssh -i MyKeyPair.pem ec2-user@x.x.x.x
```

## ステータスチェック

インスタンスに対するネットワーク疎通ができているかのチェック。

## 課金

インスタンスは、停止している場合は課金対象から外れる。
インスタンスが用いているストレージであるAmazon Elastic Block Store(EBS)は、容量を確保している間は課金対象になる。
