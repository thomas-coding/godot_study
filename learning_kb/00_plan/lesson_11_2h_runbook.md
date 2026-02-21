# 第11课 - 2h Runbook（目标门控：收集完成后解锁 Goal）

目标：在 2 小时内让关卡目标具备条件解锁机制，形成“先收集 -> 后通关”的结构化流程。

## 本课唯一目标（英文）

`Today I will gate goal completion behind collection progress and make objective flow explicit to the player.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行项目：确认第10课敌人巡逻与伤害逻辑可用。

## 10-35 min: 建立收集目标计数

- 在 `Main` 中记录关卡总收集物数量（如 `total_coins`）。
- 维护 `remaining_coins` 或完成率显示。
- HUD 增加目标提示（如 `Collect all coins to unlock goal`）。

## 35-65 min: Goal 门控逻辑

- 当收集未完成时：
  - Goal 不触发胜利（或显示未解锁提示）。
- 当收集完成后：
  - Goal 解锁并可触发 `WON`。

## 65-90 min: 反馈与提示

- HUD 显示进度（例如 `Coins: 2/5`）。
- 解锁瞬间给提示（文本/颜色变化）。
- 保证提示不与 `PAUSED/GAME_OVER/WON` 冲突。

## 90-105 min: 回归验证

- 验证链路：
  1. 未收集完触碰 Goal 不通关
  2. 收集完后触碰 Goal 才通关
  3. 重开后目标门控恢复初始

## 105-120 min: 收尾沉淀

- 更新：`learning_kb/01_learner/daily_reports/YYYY-MM-DD.md`
- 更新：`learning_kb/01_learner/current_state.md`
- 更新：`learning_kb/01_learner/mastery_map.md` / `learning_kb/01_learner/gap_backlog.md`
- 更新：`learning_kb/03_sessions/handoff_latest.md`

## 本课最小完成线

- Goal 具备“收集达标后解锁”的门控能力。
- 玩家可读到清晰的目标进度与解锁状态。
- 与现有状态机无冲突。
