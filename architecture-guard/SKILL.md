---
name: architecture-guard
description: 强制执行 Java DDD 四层架构规范，监控层级依赖越权、命名冲突及数据流转合规性。
---

# Skill: 架构守卫专家 (DDD & Clean Architecture)

## 监控准则 (The "Forbidden" List)
1. **禁止越权调用**：
   - `Controller` (API 层) 严禁直接调用 `Mapper/Repository`。
   - `Application` (应用层) 严禁编写 SQL 或直接调用第三方 SDK（必须经由基础设施层）。
   - `Domain` (领域层) 严禁依赖任何外部框架（如 Feign、Redis 客户端），必须通过接口抽象。
2. **命名强制**：
   - 接口入参必须以 `Request/Command/Query` 结尾。
   - 数据库实体必须以 `DO/Entity` 结尾。
   - 跨层传输对象必须为 `DTO` 或 `BO`。
3. **职责闭环**：
   - 所有的 `insert/update` 必须在领域层通过 `Repository` 执行。

## 执行指令 (Action Flow)
- **静态扫描**：当用户要求“写代码”或“Review”时，先扫描相关类的 `import` 语句。
- **依赖分析**：如果发现 `Api` 层引入了 `infrastructure.mapper`，立即拦截并报错。
- **自动修正**：重写逻辑，在 `Application` 层建立编排，在 `Domain` 层建立 Repository 定义。

## 触发场景
- `Cmd + K` 生成新业务代码。
- 对已有模块进行重构。
- 显式触发：`@architecture-guard 检查当前模块的层级依赖`。