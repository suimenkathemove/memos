# openapi swagger

## properties

| key         | memo             |
| ----------- | ---------------- |
| summary     |                  |
| description |                  |
| operationId | camelCase        |
| tags        | グループ化できる |

### security

#### BasicAuth

```yml
components:
  securitySchemes:
    BasicAuth:
      type: http
      scheme: basic

security:
  - BasicAuth: []
```

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

```yml
parameters:
  - in: query
    name: xxx
    schema:
      type: integer
      default: xxx
    required: true
```

#### request body

```yml
```

### responses

```yml
```
