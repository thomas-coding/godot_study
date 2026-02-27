# Learner Atomic Step Card Template

Last Updated: 2026-02-27
Status: Active
Applies To: UI / Code / Debug / Test / Release / Git

## 1) Core Card (required for every learner step)

```text
步骤名：
目标：
前提：
动作（对象/路径/命令/参数）：
验收（可观测通过标准）：
失败分叉（A/B）：
最小回退：
```

## 2) Task-Type Required Fields (append by type)

### UI / Editor

- 节点名：
- 精确类型（Godot class）：
- 父路径：
- 关键属性（Inspector）：
- 常见误选（不要选什么）：

### Code Change

- 文件路径：
- 符号定位（函数/变量/节点路径）：
- 变更块（新增/替换）：
- 预期行为（运行后应看到什么）：

### Debug / Diagnosis

- 假设：
- 观测点（日志/断点/状态值）：
- 判定分支（若A则... / 若B则...）：
- 下一动作：

### Test / Verification

- 执行入口（编辑器按钮/命令）：
- 通过标准：
- 回归范围（要顺带验证哪些旧功能）：

### Git

- 暂存边界（哪些文件可 add）：
- 提交意图（为什么提交）：
- 安全限制（禁止操作）：

## 3) Pre-Send Gates (all required)

- 完整性：字段是否缺失。
- 单义性：学员是否会有多种理解。
- 可执行性：零经验是否可照做。
- 可验证性：是否有明确通过标准。
- 可恢复性：失败后是否可最小回退。

## 4) Classroom Execution Loop (mandatory)

- 固定流程：发一步 -> 学员回执 -> 校验 -> 再发下一步。
- 禁止一次发多步半规格化指令。

## 5) Incident Tags (for retro)

- `SPEC`: 规格缺失（字段不全）。
- `PATH`: 对象/路径不明确。
- `VERIFY`: 验收标准缺失或不可观测。
- `SAFE`: 无回退或风险控制不足。
- `SCOPE`: 超出当前课次范围。

复盘规则：出现事故后，必须回写到 runbook / session protocol / template，避免同类复发。
