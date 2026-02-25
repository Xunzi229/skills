---
name: java-ddd-expert
description: Generates business logic code under SpringCloud following DDD (Domain-Driven Design) architecture. Use when the user asks to implement new business features, write Service-layer code, complete business logic, or work with Java 11, SpringBoot 2.1, Mybatis-Plus, and Gradle in a four-layer DDD structure.
---

# Java DDD 开发专家

## 触发条件

在以下情况应用本技能：

- 用户要求「实现新业务功能」「编写 Service 层代码」或「补全业务逻辑」
- 涉及技术栈：Java 11、SpringBoot 2.1、Mybatis-Plus、Gradle

## 架构约束（铁律）

四层职责严禁越权：

| 层 | 职责 | 禁止 |
|----|------|------|
| **API** | 参数校验、类型转换 | 写业务逻辑 |
| **Application** | 流程编排，调用领域服务 | 直接操作 DB/外部系统 |
| **Domain** | 业务规则；经 Repository 操作数据，经 Facade 对接外部 | 关心技术细节、直连存储 |
| **Infrastructure** | 实现 Mapper、Facade 接口 | 承载业务规则 |

## 数据流转

- **输入**：`ArgRequest` → `Param` → `Entity` / `DO`
- **输出**：`BO` → `DTO` → `VO` / `Response`

读链路：Query → 校验/Param → 应用层 → 领域 select → Repository → BO → DTO → VO/Response  
写链路：Command → 校验/Param → 应用层 → 领域交互器 + Entity → Repository 持久化 → 发布领域事件 → BO → DTO → VO/Response

## 执行指令

### 1. 任务分解

生成代码前先列出最小执行单元，例如：

- 定义 Param / Entity / BO / DTO
- 编写 Repository 接口与 Mapper
- 实现领域交互器（围绕 Entity）
- 应用层编排调用
- API 层校验与转换

### 2. 原则检查

每段代码需符合：

- **SOLID**：单一职责、依赖倒置（依赖接口）
- **DRY**：复用领域服务与 Facade，不重复业务规则
- **KISS**：一层只做一件事，避免过度抽象

### 3. 依赖与技术

- 持久层：统一使用 **Mybatis-Plus**
- 构建：**Gradle**
- 跨聚合/外部：经 **Facade** 或 Feign，不跨层直调

### 4. 一致性

- **强一致**：应用层用例 + 事务（同一聚合内）
- **跨边界/最终一致**：通过 `domain_topic` 发布领域事件，禁止跨服务直接写库

## 快速检查清单

生成或审查代码时核对：

- [ ] API 层无业务逻辑，仅校验与类型转换
- [ ] Application 层未直接写 SQL 或调外部 SDK
- [ ] Domain 层通过 Repository/Facade 访问数据与外部
- [ ] Infrastructure 仅实现接口，无业务规则
- [ ] 数据形态符合 Param → Entity/DO 与 BO → DTO → VO/Response
- [ ] 跨边界变更使用 domain_topic 领域事件
