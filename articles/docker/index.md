# Docker

- [Docker](#docker)
  - [exec](#exec)
  - [Stop all container](#stop-all-container)

## exec

```shell
docker exec -it CONTAINER bash
```

## Stop all container

```shell
docker stop $(docker ps -aq)
```
