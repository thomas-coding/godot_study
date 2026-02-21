# 第15课 - 2h Runbook（数据驱动：Resource参数化玩法）

目标：在 2 小时内把核心数值从脚本硬编码迁移到 Resource 配置，提升玩法调参与维护效率。

## 本课唯一目标（英文）

`Today I will convert key gameplay constants into Resource-driven configs for cleaner balancing workflows.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行项目：确认第14课设置菜单与持久化可用。

## 10-35 min: 定义玩法配置资源

- 新建 `GameBalanceConfig.gd`（继承 `Resource`）。
- 定义最小字段：
  - 玩家速度/跳跃参数
  - 敌人速度/伤害
  - 关卡目标收集数量
- 创建默认资源文件（如 `res://configs/balance_default.tres`）。

## 35-65 min: 替换硬编码引用

- `Player` 脚本读取配置而不是写死常量。
- `Enemy/Main` 伤害与目标计数读取配置。
- 确保配置缺失时有安全默认值。

## 65-90 min: 调参与对比

- 创建第二套配置（如 `balance_easy.tres`）。
- 用同一逻辑切换两套参数，验证玩法差异。
- 记录一组推荐默认值。

## 90-105 min: 回归验证

- 验证：
  1. 配置切换不会破坏状态机/HUD
  2. 参数变更后行为可预期
  3. 重开与关卡切换仍稳定

## 105-120 min: 收尾沉淀

- 更新：`learning_kb/01_learner/daily_reports/YYYY-MM-DD.md`
- 更新：`learning_kb/01_learner/current_state.md`
- 更新：`learning_kb/01_learner/mastery_map.md` / `learning_kb/01_learner/gap_backlog.md`
- 更新：`learning_kb/03_sessions/handoff_latest.md`

## 本课最小完成线

- 至少 1 组核心玩法参数迁移到 Resource。
- 至少 2 套配置可切换并可观察差异。
- 无红色报错。
