#!/bin/bash

target_path="$1"

# 检查参数
if [ -z "$target_path" ]; then
  echo "❌ 未提供目标路径"
  exit 1
fi

echo "开始为路径 $target_path 设置权限并添加计划任务..."

# 先尝试设置权限
echo "➡️ 执行 chmod -R 777 $target_path ..."
if chmod -R 777 "$target_path"; then
  echo "✅ 权限设置成功"
else
  echo "❌ 权限设置失败：$target_path"
fi

# 检查 crontab 是否已有此任务
cron_job="*/15 * * * * chmod -R 777 $target_path"
(crontab -l 2>/dev/null | grep -F "$cron_job") && {
  echo "⏳ Cron task already exists. No changes needed."
} || {
  echo "➕ 添加新的 crontab 任务..."
  (crontab -l 2>/dev/null; echo "$cron_job") | crontab -
  echo "✅ 新任务已添加"
}

# 手动执行一次以确保立即生效
echo "🚀 正在手动执行一次 chmod..."
chmod -R 777 "$target_path"
