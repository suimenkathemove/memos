# AWS CDK

```shell
# Init
cdk init app --language typescript

# List the stacks
cdk ls

# Bootstrap
# 初めて`cdk deploy`をする前に実行する必要がある
cdk bootstrap

# Deploy
cdk deploy

# Diff
cdk diff

# Destroy
cdk destroy
```

## 手順

1. cdk init
2. migrate to pnpm
3. exclude cdk in tsconfig, linter, formatter, test
4. delete test
5. delete README
6. add tsconfig, linter, formatter
