# DDD

- [DDD](#ddd)
  - [Domain Objects](#domain-objects)
    - [Value Object](#value-object)
      - [メリット](#メリット)
  - [Links](#links)

## Domain Objects

- [value object](./value-object.md)
- repository

### Value Object

idは利用するケースが多いので、すべてvalue objectにする(find_by_idの引数など)。

#### メリット

- 意図を明確に表現できる
- value objectの中にルールを閉じ込めることでカプセル化ができる

## Links

- <https://github.com/nrslib/itddd>
- <https://github.com/j5ik2o/rust-ddd-rest-api-template>
