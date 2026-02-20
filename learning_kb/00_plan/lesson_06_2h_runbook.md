# 第6课 - 2h Runbook（goal 完成区 + 最小胜利流程）

目标：在 2 小时内增加 `Goal(Area2D)` 完成区，形成“开始 -> 进行 -> 胜利 -> 重开”的最小流程闭环。

## 本课唯一目标（英文）

`Today I will add a goal trigger and complete a minimal win-and-restart flow.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行项目：确认第5课结果可用（收集/受伤/失败/重开）。

## 10-35 min: 创建 Goal 场景

- 新建 `Goal` 场景：根节点 `Area2D`。
- 子节点：`CollisionShape2D` + `Sprite2D`（或 `Polygon2D` 占位）。
- 保存：`projects/first-game/scenes/goal.tscn`。

## 35-65 min: 建立胜利信号

- `goal.gd` 监听 `body_entered`。
- 当 `Player` 进入时发射 `reached_goal`。
- `Main` 连接后进入 `won` 状态：
  - 显示 `You Win` 标签。
  - 暂停玩家操作（可通过状态门控或暂停树）。

## 65-90 min: 胜负状态互斥与输入治理

- 保证 `won` 与 `game_over` 互斥（只允许一个终态）。
- `P` 仅在 play 状态可用；终态下禁用 pause 切换。
- `R` 在任意终态可重开。

## 90-105 min: 体验稳定化

- 校验提示文本：`Start` / `Paused` / `Game Over` / `You Win` 不互相冲突。
- 校验输入优先级：热键集中在 `Main._unhandled_input`。
- 若出现重复触发，使用 `set_input_as_handled()` 或状态锁。

## 105-120 min: 收尾沉淀

- 更新：`learning_kb/01_learner/daily_reports/YYYY-MM-DD.md`
- 更新：`learning_kb/01_learner/current_state.md`
- 更新：`learning_kb/01_learner/mastery_map.md` / `learning_kb/01_learner/gap_backlog.md`
- 更新：`learning_kb/03_sessions/handoff_latest.md`

## 本课最小完成线

- `Player` 进入 `Goal(Area2D)` 触发胜利状态。
- 胜利后显示提示且玩法不再继续推进。
- `R` 重开可回到初始状态，无红色报错。
