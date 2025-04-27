# 自动保活lsky（兰空图床）文件夹权限  
## 使用方法：
1. Fork本项目；
2. 添加TARGETS_JSON变量；
3. 启动actions  
## tips：
- 每10分钟进行一次检测，若cron计划任务不存在，则重新添加并立即执行cron计划任务；
- 添加的cron计划任务默认设置为每5分钟执行一次，即 `*/5 * * * * chmod -R 777 你的路径`。

## TARGETS_JSON 格式
```json
[
  {
    "name": "S16-01",
    "ip": "s16.serv00.com",
    "port": 22,
    "user": "用户名",
    "password": "密码",
    "path": "/usr/home/用户名/domains/用户名.serv00.net/public_html/storage"
  },
  {
    "name": "S16-02",
    "ip": "s16.serv00.com",
    "port": 22,
    "user": "用户名",
    "password": "密码",
    "path": "/usr/home/用户名/domains/自定义域名/public_html/storage"
  }
]
```
## 免责声明
本程序仅供学习了解, 非盈利目的，请于下载后 24 小时内删除, 不得用作任何商业用途, 代码、数据及图片均有所属版权, 如转载须注明来源。 使用本程序必循遵守部署免责声明。使用本程序必循遵守部署服务器所在地、所在国家和用户所在国家的法律法规, 程序作者不对使用者任何不当行为负责。

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=qianhu111/lsky-cron&type=Date)](https://www.star-history.com/#qianhu111/lsky-cron&Date)
