# Docker

- [Docker](#docker)
  - [exec](#exec)
  - [Stop all container](#stop-all-container)
  - [Troubleshooting](#troubleshooting)
    - [com.docker.backend cannot start](#comdockerbackend-cannot-start)

## exec

```shell
docker exec -it CONTAINER bash
```

## Stop all container

```shell
docker stop $(docker ps -aq)
```

## Troubleshooting

### com.docker.backend cannot start

```sh
rm -rf ~/.docker
```
