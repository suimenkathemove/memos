# openapi swagger

## properties

| key         | description      |
| ----------- | ---------------- |
| summary     |                  |
| description |                  |
| operationId |                  |
| tags        | グループ化できる |

### parameters

#### path

```yml
parameters:
  - in: path
    name: xxx(e.g., id)
    description: xxx
    schema:
      type: integer
      default: xxx
    required: true
```

#### query parameter

```yaml
parameters:
  - in: query
    name: xxx
    schema:
      type: integer
      default: xxx
    required: true
```

### responses
