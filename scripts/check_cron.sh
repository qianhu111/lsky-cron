#!/bin/bash

target_path="$1"
cron_expr="0 * * * * chmod -R 777 $target_path"

existing_cron=$(crontab -l 2>/dev/null || true)

if echo "$existing_cron" | grep -Fq "$cron_expr"; then
    echo "Cron task already exists. No changes needed."
else
    echo "Cron task not found. Re-adding it..."
    (echo "$existing_cron"; echo "$cron_expr") | crontab -
    echo "Cron task re-added."
fi

echo "Executing command manually once..."
chmod -R 777 "$target_path"
