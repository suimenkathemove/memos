# Docker

- [Docker](#docker)
  - [exec](#exec)
  - [Stop all containers](#stop-all-containers)
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
docker exec -it CONTAINER bash
```

## Stop all containers

```sh
docker stop $(docker ps -qa)
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
