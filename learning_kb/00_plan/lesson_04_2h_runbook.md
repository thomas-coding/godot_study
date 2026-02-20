# 第4课 - 2h Runbook（start gate + pause/restart 稳定化）

目标：在 2 小时内把第3课的可收集闭环升级为“可进入、可暂停、可重开”的最小状态流（`start -> play -> pause -> restart`）。

## 本课唯一目标（英文）

`Today I will add a minimal start-to-play state and stabilize pause/restart behavior with clear input and process-mode gates.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行当前项目：确认第3课基线可用（收集/计数/P 暂停/R 重开）。

## 10-35 min: 增加 start gate（进入 play 前置状态）

- 在 `Main` 增加最小状态变量（例如 `is_game_started` 或 `game_state`）。
- 加 `StartLabel`（如 `Press Enter to Start`）。
- 在开始前禁用玩法输入（推荐只保留启动热键）。
- 按 `Enter` 后：隐藏 `StartLabel`，进入 `play`。

## 35-65 min: 稳定 pause/restart 语义

- 保持 `Main` 为 `PROCESS_MODE_ALWAYS`（持续接收热键）。
- 保持玩法节点（`Player`/`Coin`）为 `PROCESS_MODE_PAUSABLE`。
- `pause_toggle` 只在允许状态下生效；`restart` 需先确保 `get_tree().paused = false` 再重开。

## 65-90 min: 标准化 layer/mask 约定

- 建立最小约定：`Player=1`, `World=2`, `Collectible=3`。
- `Coin(Area2D)` 的 `collision_mask` 只检测 `Player` 层。
- 记录约定到课堂笔记，避免后续“看起来碰到了但不触发”。

## 90-105 min: 排错与回归

- 用模板检查：
  - `learning_kb/04_templates/gameplay_state_pause_restart_troubleshooting_checklist.md`
- 快速回归顺序：
  1. 未开始时不应进入玩法
  2. 开始后可收集并加分
  3. `P` 可暂停/恢复
  4. `R` 可重开并恢复初始状态

## 105-120 min: 收尾沉淀

- 更新：`learning_kb/01_learner/daily_reports/YYYY-MM-DD.md`
- 更新：`learning_kb/01_learner/current_state.md`
- 更新：`learning_kb/01_learner/mastery_map.md` / `learning_kb/01_learner/gap_backlog.md`
- 更新：`learning_kb/03_sessions/handoff_latest.md`

## 本课最小完成线

- 具备 `start -> play` 入口控制。
- `pause/restart` 在 play 状态下稳定可用。
- 重开后分数归零、coin 恢复，运行无红色报错。
