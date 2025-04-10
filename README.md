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
    "path": "/usr/home/用户名/domains/域名/public_html/storage"
  },
  {
    "name": "S16-02",
    "ip": "s16.serv00.com",
    "port": 22,
    "user": "用户名",
    "password": "密码",
    "path": "/usr/home/用户名/domains/域名/public_html/storage"
  }
]
```
