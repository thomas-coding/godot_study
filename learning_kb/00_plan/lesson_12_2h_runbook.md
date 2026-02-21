# 第12课 - 2h Runbook（关卡切换：Level 1 -> Level 2）

目标：在 2 小时内完成两关最小切换流程，形成“完成一关进入下一关”的完整节奏。

## 本课唯一目标（英文）

`Today I will implement a minimal two-level flow with scene switching and state reset consistency.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行项目：确认第11课目标门控流程可用。

## 10-35 min: 创建第二关场景

- 复制第一关结构，创建 `level_02.tscn`（可简化布局）。
- 保留核心节点：Player、Ground、Coin/Hazard/Goal、HUD。

## 35-65 min: 通关切换逻辑

- 在 `WON` 后触发场景切换：
  - `change_scene_to_file("res://scenes/level_02.tscn")`（示例）
- 保留 `R` 重开当前关卡语义。

## 65-90 min: 状态一致性校验

- 验证切换后：
  - 状态回到 `WAIT_START`
  - HUD 数值与提示重置
  - `pause/restart` 行为正常

## 90-105 min: 失败路径回归

- 在 Level 2 中验证 `GAME_OVER` 路径与重开。
- 确认不会残留 Level 1 的目标计数或终态标记。

## 105-120 min: 收尾沉淀

- 更新：`learning_kb/01_learner/daily_reports/YYYY-MM-DD.md`
- 更新：`learning_kb/01_learner/current_state.md`
- 更新：`learning_kb/01_learner/mastery_map.md` / `learning_kb/01_learner/gap_backlog.md`
- 更新：`learning_kb/03_sessions/handoff_latest.md`

## 本课最小完成线

- 至少两关可切换（Level 1 完成后进入 Level 2）。
- 切换后状态与 HUD 一致重置。
- 无红色报错。
