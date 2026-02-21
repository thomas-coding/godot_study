# 第8课 - 2h Runbook（状态机重构 + 输入门控统一）

目标：在 2 小时内把 `Main` 的多布尔状态重构为统一状态机，消除输入冲突与终态穿透问题。

## 本课唯一目标（英文）

`Today I will refactor gameplay flow into one explicit state machine and make input handling deterministic.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行项目：确认第7课基线可用（Camera2D follow + start/pause/restart + game over/win）。

## 10-35 min: 建立统一状态机

- 在 `main.gd` 定义状态枚举（示例）：
  - `WAIT_START`, `PLAYING`, `PAUSED`, `GAME_OVER`, `WON`
- 新增统一状态变量（如 `game_state`），替代分散布尔门控。
- 新增 `set_game_state(next_state)`，集中处理：
  - `SceneTree.paused` 切换
  - 标签显示刷新（Start/Pause/GameOver/Win）

## 35-65 min: 输入路由重构

- `restart` 保持全局可用（任何状态可重开）。
- `start_game` 仅在 `WAIT_START` 生效。
- `pause_toggle` 仅在 `PLAYING/PAUSED` 生效。
- 终态（`GAME_OVER/WON`）禁止进入玩法输入分支。

## 65-90 min: 玩法回调门控统一

- `coin collected` 只在 `PLAYING` 生效。
- `hazard hit` 只在 `PLAYING` 生效。
- `goal reached` 只在 `PLAYING` 生效。
- 保证 `GAME_OVER` 与 `WON` 互斥，不可重复进入。

## 90-105 min: 状态迁移回归

- 验证迁移链路：
  1. `WAIT_START -> PLAYING`
  2. `PLAYING <-> PAUSED`
  3. `PLAYING -> GAME_OVER`
  4. `PLAYING -> WON`
  5. 任意状态 `-> restart -> WAIT_START`

## 105-120 min: 收尾沉淀

- 更新：`learning_kb/01_learner/daily_reports/YYYY-MM-DD.md`
- 更新：`learning_kb/01_learner/current_state.md`
- 更新：`learning_kb/01_learner/mastery_map.md` / `learning_kb/01_learner/gap_backlog.md`
- 更新：`learning_kb/03_sessions/handoff_latest.md`

## 本课最小完成线

- 仅保留一个可解释状态源（状态机变量）。
- 输入处理无冲突、无重复触发、无终态穿透。
- 现有玩法功能不回归。
