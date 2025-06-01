# gcloud cli

## Auth

```sh
gcloud auth login

# ログイン状態の確認
gcloud auth list
```

## Project

```sh
gcloud projects create $(PROJECT_ID)
```

## alpineにgcloud cliをインストールするDockerfile

```Dockerfile
RUN apk add --no-cache \
  bash \
  curl \
  python3
RUN curl -sSL https://sdk.cloud.google.com | bash
ENV PATH $PATH:/root/google-cloud-sdk/bin
```
