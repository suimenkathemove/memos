# aws-cli

- [aws-cli](#aws-cli)
  - [Command](#command)
    - [ACCOUNT IDを取得する](#account-idを取得する)
    - [Regionを取得する](#regionを取得する)
  - [Docker](#docker)

## Command

### ACCOUNT IDを取得する

```sh
aws sts get-caller-identity --query "Account" --output text
```

### Regionを取得する

```sh
aws configure get region
```

## Docker

- <https://github.com/suimenkathemove/docker-sandbox/tree/main/aws-cli>
- <https://github.com/suimenkathemove/monorepo-sandbox/tree/main/infrastructure/cloud_formation>
