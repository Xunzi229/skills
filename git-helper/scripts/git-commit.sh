#!/bin/bash

# 检查是否有暂存文件
if [ -z "$(git diff --cached)" ]; then
    echo "❌ 错误：没有暂存的文件，请先执行 git add"
    exit 1
fi

# 获取当前分支名
BRANCH=$(git rev-parse --abbrev-ref HEAD)
MSG="$1"

if [ -z "$MSG" ]; then
    echo "❌ 错误：必须提供提交信息"
    exit 1
fi

echo "🚀 开始执行提交流..."

# 1. 提交（强制只使用 -m，彻底杜绝 trailer）
git commit -m "$MSG"

# 2. 拉取并变基
echo "🔄 正在拉取远端更新 (rebase)..."
git pull -r origin "$BRANCH"

# 3. 推送
echo "📤 正在推送到远端..."
git push origin "$BRANCH"

echo "✅ 任务完成！"