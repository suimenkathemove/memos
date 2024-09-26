# DDD

- [DDD](#ddd)
  - [Value Object](#value-object)
    - [メリット](#メリット)
  - [Entity](#entity)
  - [Domain Service](#domain-service)
  - [Repository](#repository)
  - [Application Service](#application-service)
  - [Controller](#controller)
  - [DI](#di)
  - [Links](#links)

## Value Object

idは利用するケースが多いので、すべてvalue objectにする(find_by_idの引数など)。

### メリット

- 意図を明確に表現できる
- value objectの中にルールを閉じ込めることでカプセル化ができる

## Entity

## Domain Service

## Repository

Repository層といったり、Infrastructure層といったりする。

mutationは、createとupdateを分ける。saveでまとめない。updateのinputの属性はオプショナルの場合があるから。

## Application Service

UseCase層。

## Controller

## DI

## Links

- <https://github.com/nrslib/itddd>
- <https://github.com/j5ik2o/rust-ddd-rest-api-template>
