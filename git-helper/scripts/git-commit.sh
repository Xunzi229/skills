#!/bin/bash
msg="$1"
if [ -z "$msg" ]; then
    echo "❌ 错误：提交信息不能为空"
    exit 1
fi
git commit -m "$msg"
echo "✅ Git Commit 成功！"
