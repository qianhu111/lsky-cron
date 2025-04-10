#!/bin/bash

target_path="$1"

echo "开始为路径 $target_path 设置权限并添加计划任务..."

# 检查是否已有计划任务
if crontab -l 2>/dev/null | grep -q "chmod -R 777 $target_path"; then
  echo "✅ 已存在计划任务，无需添加"
else
  echo "➡️ 执行 chmod -R 777 $target_path ..."
  chmod -R 777 "$target_path"
  echo "✅ 权限设置成功"

  echo "➕ 添加新的 crontab 任务..."
  (crontab -l 2>/dev/null; echo "*/5 * * * * chmod -R 777 $target_path") | crontab -
  echo "✅ 新任务已添加"
fi

echo "🚀 正在手动执行一次 chmod..."
chmod -R 777 "$target_path"
