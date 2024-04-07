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
3. add tsconfig, linter, formatter
   1. exclude cdk
4. delete test
5. fix README
6. .vscode
7. .github
8. cargo-make
   1. .env.development

## 参考

- <https://github.com/suimenkathemove/aws-sandbox/tree/main/cdk-sandbox>
- <https://github.com/suimenkathemove/notion-clone/tree/main/infrastructure/cdk/notion-clone>
