# systemctl

指定したコマンドを起動、停止、再起動するコマンド。

```sh
systemctl start httpd.service
systemctl stop httpd.service
systemctl restart httpd.service

# 自動起動をon
systemctl enable httpd.service
# 自動起動をoff
systemctl disable httpd.service
# 自動起動の設定を確認
systemctl list-unit-files -t service
```
