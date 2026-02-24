---
name: doc-to-doc-converter
description: Monitors docs/ for Markdown (.md) changes and converts them to doc via scripts/md2doc.sh. Use when the user says "转换文档", "Update doc", "把 docs 里的 md 转了", "同步文档", or "转换格式", or when docs/ files are updated.
---

# Doc-to-doc Converter

## 触发条件

当用户说出以下任一表述时应用本技能：

- "转换文档"
- "Update DOC"
- "把 docs 里的 md 转了"
- "同步文档"
- "转换格式"
- "转doc"

或当检测到 `docs/` 目录下 .md 文件有新增/修改时。

## 执行步骤

1. **识别目标**：定位 `docs/` 下需要转换的 .md 文件（本次对话中新增或修改的，或用户指定的）。若用户未指定，则列出 `docs/` 下所有 .md 并全部转换。
2. **调用工具**：对每个目标文件执行：
   ```bash
   bash scripts/md2doc.sh "path/to/file.md"
   ```
   使用项目根目录为工作目录，`path/to/file.md` 为相对于项目根的路径或绝对路径。
3. **输出**：每个文件转换成功后仅输出一行：
   ```
   ✅ [文件名].doc 已生成
   ```
   不解释 Pandoc、脚本参数或实现细节。

## 约束

- 仅对 `docs/` 下的 .md 文件执行转换。
- 执行与输出保持静默：不输出冗长说明、不解释命令含义。
- 若 `scripts/md2doc.sh` 不存在或执行失败，只报错并停止，不尝试替代实现。
