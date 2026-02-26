# 第18课 - 2h Runbook（关卡事件系统：触发器 + 一次性事件）

目标：在 2 小时内建立最小事件系统，让关卡可通过触发器驱动一次性事件并避免重复触发。

## 本课唯一目标（英文）

`Today I will implement a minimal trigger-based event system with one-shot guards and stable reset behavior.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行项目：确认第17课敌人扩展基线可用。

## 10-30 min: 设计事件最小模型

- 定义事件结构（推荐字典或资源字段）：
  - `event_id`
  - `trigger_once`（是否一次性）
  - `target_action`（执行动作）
- 约定事件执行入口（建议集中在 `Main` 或 `EventManager`）。

## 30-60 min: 实装触发器

- 新建最小触发器节点（`Area2D`）并发送事件信号。
- 触发条件至少支持：
  1. 玩家进入触发区
  2. 触发后立即标记已触发（一次性）
- 支持至少 2 个目标动作中的 1 个：
  - 开门/移除障碍
  - 刷新提示/HUD 文本
  - 生成奖励/敌人

## 60-85 min: 一次性与去重保护

- 增加 `triggered_event_ids`（集合）防重复触发。
- 确保同一帧多次进入不会重复执行动作。
- 对非法事件 ID 做保护日志（不让流程崩溃）。

## 85-100 min: 重开与关卡切换回归

- 验证：
  1. 本局内一次性事件不会重复触发
  2. `R` 重开后一次性事件恢复初始可触发
  3. 切到下一关后不污染当前关事件状态

## 100-110 min: 最小可复用模板

- 产出 1 个“新事件接入模板”注释块：
  - 新建触发器
  - 配置 `event_id`
  - 绑定目标动作
  - 验收检查项

## 110-120 min: 收尾沉淀

- 更新：`learning_kb/01_learner/daily_reports/YYYY-MM-DD.md`
- 更新：`learning_kb/01_learner/current_state.md`
- 更新：`learning_kb/01_learner/mastery_map.md` / `learning_kb/01_learner/gap_backlog.md`
- 更新：`learning_kb/03_sessions/handoff_latest.md`

## 本课最小完成线

- 至少 1 个触发器可驱动 1 个目标事件动作。
- 一次性事件去重有效，重开后恢复初始。
- 主流程可玩，无红色报错。
