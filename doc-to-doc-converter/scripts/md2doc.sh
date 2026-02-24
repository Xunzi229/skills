#!/bin/bash
# 自动转换脚本：处理传入的 md 文件
f="$1"
if [ -f "$f" ]; then
    echo "正在转换: $f ..."
    pandoc "$f" -o "${f%.md}.docx"
#    pandoc "$f" -o "${f%.md}.pdf" --pdf-engine=xelatex -V mainfont="Source Han Serif SC"
    echo "✅ 转换完成: ${f%.md}.docx"
else
    echo "❌ 错误: 文件 $f 不存在"
fi