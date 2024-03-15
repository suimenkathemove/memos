# EC2

- [EC2](#ec2)
  - [props](#props)
    - [AMI](#ami)
      - [Amazon Linux](#amazon-linux)
    - [インスタンスタイプ](#インスタンスタイプ)
    - [associatePublicIpAddress](#associatepublicipaddress)
  - [キーペア](#キーペア)

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
