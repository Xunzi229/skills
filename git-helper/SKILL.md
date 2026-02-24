---
name: git-helper
description: 自动分析 git diff，生成符合 Angular 规范的 commit message，并执行提交。
---

# Skill: Git 提交专家

## 核心任务
1. **分析变更**：执行 `git diff --cached` 获取当前暂存区的代码变动。
2. **分类定位**：将变动归类为：feat, fix, docs, style, refactor, test, chore。
3. **格式化输出**：严格遵守 `<type>(<scope>): <subject>` 格式。

## 执行指令 (Action Flow)
- **第一步**：运行 `git status` 检查是否有暂存文件。若无，提醒用户先 `git add`。
- **第二步**：运行 `git diff --cached`。
- **第三步**：根据差异生成简洁的总结（不超过 50 个字符）。
- **第四步**：询问用户确认：“是否执行提交？[Y/N]”。
- **第五步**：执行 `git commit -m "[生成的消息]"`。

## 约束条件
- **禁止废话**：生成消息时不要加“好的”、“我认为”等前缀。
- **语言**：Commit message 必须使用英文（符合国际化开源规范）。
- **范围感应**：自动推断 `(<scope>)`，例如修改了 `order` 模块，scope 就是 `order`。