#!/bin/bash

target_path="$1"
cron_cmd="chmod -R 777 $target_path"
cron_job="*/10 * * * * $cron_cmd"

echo "开始为路径 $target_path 设置权限并添加计划任务..."

# 检查是否已有该 cron 命令
existing=$(crontab -l 2>/dev/null | grep -F "$cron_cmd")

if [ -z "$existing" ]; then
  echo "➕ 添加新的 crontab 任务..."
  (crontab -l 2>/dev/null; echo "$cron_job") | crontab -
  
  echo "🚀 正在手动执行一次 chmod..."
  eval "$cron_cmd"
else
  echo "✅ 已存在相同 cron 任务，无需重复添加，也无需重复 chmod。"
fi
