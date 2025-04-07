#!/bin/bash

# 禁用调试信息
# set +x  # 禁用 set -x

# 确保在交互式 shell 下显示输入提示
if [[ -t 0 ]]; then
    # 仅在交互式终端下执行以下命令
    echo "✅ 脚本开始执行..."
    
    # 支持参数传入路径
    if [ -z "$1" ]; then
        read -p "请输入要设置权限的路径（绝对路径）: " target_path
    else
        target_path="$1"
    fi
else
    echo "❌ 非交互式 shell 环境，无法进行路径输入。"
    exit 1
fi

# 校验路径是否为空
if [ -z "$target_path" ]; then
    echo "❌ 路径不能为空，已退出。"
    exit 1
fi

# 校验路径是否存在
if [ ! -d "$target_path" ]; then
    echo "❌ 目录不存在：$target_path"
    exit 1
fi

# 立即执行一次 chmod
chmod -R 777 "$target_path"
echo "✅ 已立即执行：chmod -R 777 $target_path"

# 构建 cron 任务行
cron_job="*/5 * * * * chmod -R 777 $target_path >> /tmp/chmod_cron.log 2>&1"

# 检查是否已存在相同任务
if crontab -l 2>/dev/null | grep -q "$cron_job"; then
    echo "✅ 已存在相同的 cron 任务，无需重复添加。"
else
    # 添加到 crontab
    (crontab -l 2>/dev/null; echo "$cron_job") | crontab -
    echo "✅ 成功添加 cron 任务：每5分钟执行 chmod -R 777 $target_path"
fi
