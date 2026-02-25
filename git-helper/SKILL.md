---
name: git-helper
description: 自动分析变动并使用安全脚本提交代码。触发词：“提交代码”、“push代码”。
---

# Skill: Git 提交专家 (脚本安全版)

## 核心任务
1. **生成消息**：分析 `git diff --cached`，生成符合 Angular 规范的中文 Commit Message。
   - 格式：`<type>(<scope>): <subject>`
2. **执行脚本**：直接调用 `$CURSOR_SKILLS/git-helper/scripts/git-commit.sh`, 未找到脚本情况下直接停止提交。

## 执行指令 (Action Flow)
- **分析**：执行 `git diff --cached`。
- **生成**：构造 `<type>(<scope>): <subject>` 格式的字符串。
- **确认**：展示生成的消息，并询问：“是否执行脚本提交并推送？[Y/N]”。
- **执行**：运行命令 `bash $CURSOR_SKILLS/git-helper/scripts/git-commit.sh "[生成的消息]"`, 未找到脚本情况下直接停止提交。

## 约束条件
- **严禁干预**：禁止在调用脚本时添加任何额外的 git 参数。
- **原生调用**：必须通过 `bash` 显式调用脚本，确保提交逻辑完全受脚本控制。