# aws-cli

- [aws-cli](#aws-cli)
  - [Command](#command)
    - [ACCOUNT IDを取得する](#account-idを取得する)
    - [Regionを取得する](#regionを取得する)
  - [参考](#参考)

## Command

### ACCOUNT IDを取得する

```sh
aws sts get-caller-identity --query "Account" --output text
```

### Regionを取得する

```sh
aws configure get region
```

## 参考

- <https://github.com/suimenkathemove/aws-sandbox/tree/main/aws-cli>
