# ChatGPT VSCode Extension from local

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

<https://www.inoichan.com/entry/2023/03/19/%E5%89%8A%E9%99%A4%E3%81%95%E3%82%8C%E3%81%A6%E3%81%97%E3%81%BE%E3%81%A3%E3%81%9Fvscode-chatgpt%E3%82%92%E5%8B%95%E3%81%8B%E3%81%99%E6%96%B9%E6%B3%95>
