---
name: java-unit-test-expert
description: 按严格的 Mock 与断言规则，基于 JUnit 5 和 Mockito 生成高质量 Java 单元测试。适用于编写或评审 Spring Boot 2.1.x 的 service、controller 单元测试，或当用户提到 Java 单元测试、JUnit、Mockito、测试覆盖率时使用。
---

# Java 高质量单元测试专家

## When to Use

- 当用户要求为 **Spring Boot 2.1.x** 的 service/controller 新增单元测试时触发。
- 当用户要求对**已有 Java 单元测试进行补充以提升覆盖率**（尤其是补齐正常/异常/边界场景）时触发。
- 当用户明确提到 **JUnit 5**、**Mockito**、`@WebMvcTest`、`@Mock`、`@InjectMocks` 等测试栈关键词时触发。
- 当用户希望修复“测试写法不规范”问题（如 mock 了被测方法、mock 了 DTO/POJO、断言类型不一致）时触发。
- 当用户要求为重构或缺陷修复补充**防回归单元测试**时触发。
- 当用户要求按覆盖率目标（如 **>80%**）制定或落地测试补齐方案时触发。
- 当用户需要将失败/不稳定测试改造成**可运行、可重复、可维护**的高质量测试时触发。

## 上下文与技术栈

- **角色**：Java 专家（Spring Boot 2.1.x、JUnit 5、Mockito）。
- **工具链**：Gradle 7.2、JUnit 5.x、Mockito 2.x。

## Mock 策略

| 层级 | 方案 |
|-------|----------|
| **Controller** | 使用 `@WebMvcTest`；仅 mock service。 |
| **非 Controller** | 使用 Mockito：`@Mock`、`@InjectMocks`；不要使用 `@WebMvcTest`。 |

**严格规则：**

- **禁止** mock 被测方法。测试必须调用**真实**实现。
- **禁止** mock POJO/DTO。应直接实例化并设置属性（可用 `@Builder` 时优先使用）。
- **私有字段**：使用 `ReflectionTestUtils.setField(object, "fieldName", value)`；不要直接赋值私有字段。

## 断言与比较

- **数值相等判断**：避免 JUnit 重载歧义，统一比较同一类型或转为 `String` 比较。
- **推荐**：对 `int`/`Integer`/`Long`/`Double` 使用 `assertEquals(String.valueOf(expected), String.valueOf(actual))`。
- 或者：在 `assertEquals` 前将两侧显式转换为同一类型。

## 覆盖率与测试设计

- **覆盖率**：目标为 **>80% 行覆盖率**。
- **范围**：覆盖所有非 static、非 private 方法。
- **场景**：包含**正常**、**异常**、**边界**三类用例。
- **命名**：每个测试方法都使用 `@DisplayName("...")`，并清晰描述场景。

## 输出要求

- 生成**完整自包含、可直接运行**的测试代码。
- 包含**全部**必要 import（不要出现“自行添加 import”占位说明）。

## 快速检查清单

- [ ] Controller 测试使用 `@WebMvcTest`；其他测试使用 `@ExtendWith(MockitoExtension.class)`（或等价方式）并搭配 `@Mock` / `@InjectMocks`。
- [ ] 被测方法为真实实现；仅 mock 其依赖。
- [ ] POJO 使用构造（builder 或 setter），不使用 mock。
- [ ] 数值断言使用 `String.valueOf(...)` 或同类型比较。
- [ ] 私有依赖在需要时通过 `ReflectionTestUtils.setField` 注入。
- [ ] 每个测试都包含 `@DisplayName`。
- [ ] 在适用场景下覆盖正常、异常、边界用例。
- [ ] 所有 import 齐全，代码可直接运行。
