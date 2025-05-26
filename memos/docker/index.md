# Docker

- [Docker](#docker)
  - [exec](#exec)
  - [Stop all containers](#stop-all-containers)
  - [Delete all images](#delete-all-images)
  - [Delete all volumes](#delete-all-volumes)
  - [image push](#image-push)
  - [Troubleshooting](#troubleshooting)
    - [com.docker.backend cannot start](#comdockerbackend-cannot-start)

Dockerには以下の4つのリソースがある。

- Image
- Container
- Volume
- Network

## exec

```sh
docker exec -it CONTAINER sh

# docker composeを使っている場合は以下のコマンドで代用できる
docker compose run <service name> sh
```

## Stop all containers

```sh
docker stop $(docker ps -qa)
```

## Delete all images

```sh
docker image prune -a -f
```

## Delete all volumes

```sh
docker volume rm $(docker volume ls -q)
```

## image push

```sh
docker image push NAME[:TAG]
```

## Troubleshooting

### com.docker.backend cannot start

```sh
rm -rf ~/.docker
```
