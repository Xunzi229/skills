---
name: git-helper
description: 自动分析变动并使用安全脚本提交代码。触发词：“提交代码”、“push代码”、“git push”、“push” 。
---

# Skill: Git 提交终极版（中文 + gitmoji + 多行列表）

## 触发词（任一匹配即可）
提交代码
push代码
上传代码
git push
代码提交
push
提交一下
帮我提交
commit
提代码

## 生成Message规则

根据 git diff --cached 内容，生成如下格式的 commit message：

第一行（标题行）：
{emoji} {type}({scope}): {一句话中文标题}

要求：
- type 只选一个最主要的，从以下列表中选
- scope 为改动最核心的模块/目录/功能名（中文或英文，建议 3~12 个汉字/字符）
- 标题用「动词 + 核心内容」风格，例如：新增XX、修复XX、优化XX、重构XX、完善XX
- 标题长度尽量控制在 8~38 个汉字
- 标题末尾**不加**句号

正文（body）：
- 使用 - 开头的 bullet list
- 每条一句，描述做了什么或为什么改
- 每条尽量控制在 60 字以内
- 最多 8 条，重点突出变化意图
- 全部用中文

常用类型与 emoji 对应表（必须使用以下之一）：

feat     ✨   新增/扩展功能
fix      🐛   修复缺陷
test     🧪   测试新增/完善/修复
refactor ♻️   重构（无行为变化）
style    🎨   代码格式/样式调整
docs     📝   文档、注释、README
chore    🔧   构建/工具/配置/依赖
perf     ⚡   性能优化
ci       👷   CI/CD 流水线
revert   ⏪   回滚提交
build    🏗️   构建系统/外部依赖

## 示例输出格式（直接这样给用户看）
🧪 test(库存分析): xxx
   1. xxxxxxx
   1. xxxxxxx

## 交互流程

1. 生成上述格式的完整多行消息
2. 展示给用户，并询问：
即将使用的提交信息如下：
[粘贴完整多行消息]

确认提交并推送？  [Y/n/edit/discard]

支持选项：
- Y / 是 / 回车 → 执行提交+推送
- n / 否 → 取消本次提交
- edit → 让用户手动修改后再确认
- discard → 放弃暂存区所有变更（git restore --staged .）

3. 确认后调用安全脚本：

```bash
bash $$   CURSOR_SKILLS/git-helper/scripts/git-commit.sh "   $$完整多行消息"
```

### 硬约束

- 禁止直接执行 git commit / git push 命令
- 禁止自动 git add 任何文件
- diff 为空时回复：暂存区没有变更，无需提交
- 生成失败时 fallback：chore: update
- 标题禁止全英文（专有名词除外）
- 正文禁止空行（只用 - 列表）
- 所有中文内容使用简体中文
- **严禁干预**：禁止在调用脚本时添加任何额外的 git 参数。
- **原生调用**：必须通过 `bash` 显式调用脚本，确保提交逻辑完全受脚本控制。