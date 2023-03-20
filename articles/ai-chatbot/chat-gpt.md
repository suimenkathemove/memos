# ChatGPT

## VSCode Extension from local

```shell
git clone https://github.com/gencay/vscode-chatgpt.git
cd /path/to/vscode-chatgpt
yarn

brew install libsecret
yarn global add @vscode/vsce
cd /path/to/vscode-chatgpt
npx vsce package
code --install-extension vscode-chatgpt-3.9.7-0.vsix
```

VSCodeのコマンドパレットに`vsix`を入力して`Extensions: Install from VSIX...`を実行
