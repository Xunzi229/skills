---
name: auto-doc
description: 自动根据 git diff 或代码变更更新 README.md 和 CHANGELOG.md。
---

# Skill: 自动化文档维护者 (The Documenter)

## 核心任务
1. **变更提取**：分析当前工作区或 `git diff` 中的逻辑变化（新增功能、修复 Bug、架构调整）。
2. **README 同步**：如果新增了配置项（.yml/.properties）或对外接口，自动更新 README 的“配置说明”或“快速开始”。
3. **CHANGELOG 记录**：按照 [Keep a Changelog](https://keepachangelog.com) 规范，将变更归类为 [Added], [Changed], [Fixed], [Removed]。

## 执行指令 (Action Flow)
- **分析阶段**：执行 `git diff --cached` 或扫描当前修改的文件。
- **比对阶段**：检查 `README.md` 是否包含已过时的示例代码或配置项。
- **写入阶段**：
    - 在 `CHANGELOG.md` 顶部的 `[Unreleased]` 或当前日期版本下追加条目。
    - 采用简洁的 Bullet points，严禁长篇大论。
- **清理阶段**：确保 Markdown 语法正确，层级清晰。

## 约束条件
- **准确性**：禁止编造未发生的变更。
- **语言**：文档语言应与现有文档保持一致（建议中文）。
- **版本建议**：根据变更幅度建议 SemVer 版本号（如 1.0.1 -> 1.1.0）。