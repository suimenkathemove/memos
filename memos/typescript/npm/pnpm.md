# pnpm

## Install

```shell
pnpm install --no-frozen-lockfile
```

### target arch

```shell
npm_config_target_arch=x64 pnpm install
```

## Migrate to pnpm

```shell
rm -rf node_modules
pnpm import
# delete lockfile
rm package-lock.json
rm yarn.lock
pnpm i
```

### References

- <https://dev.to/andreychernykh/yarn-npm-to-pnpm-migration-guide-2n04>
