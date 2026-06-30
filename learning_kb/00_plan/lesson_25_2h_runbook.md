# 第25课 - 2h Runbook（复杂 Boss 对象组织与战斗威胁）

目标：在 2 小时内把 Boss 战补强作为“复杂对象组织”练习，重点学习状态、碰撞、反馈、结算的职责拆分，而不是堆更多 Boss 内容。

## 本课唯一目标（英文）

`Today I will organize the Boss as a complex gameplay object with clear state, damage, feedback, and reset boundaries.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行项目，确认第24课 Boss encounter 基线可用。
- 快速回归：
  - start
  - pause/resume
  - restart
  - Boss 侧碰伤害
  - Boss 踩踏受伤
  - Boss 击败奖励
  - Boss 门控/出口解锁

## 10-25 min: 固定学习边界

- 本课学习重点：
  1. Boss 状态如何拆分。
  2. Boss 碰撞判定如何和玩家伤害区分。
  3. Boss 反馈如何不污染通关状态。
  4. Boss 重开后如何恢复初始状态。
- 明确不做：
  - 不做完整 Boss 动画状态机。
  - 不做多种攻击模式。
  - 不做新关卡。
  - 不做导出。

## 25-45 min: 梳理 Boss 状态职责

- 检查 `projects/first-game/scenes/boss.gd`：
  - HP：`hp_max` / `hp_current`
  - 阶段：`BossPhase`
  - 受击反馈：`Visual.modulate`
  - 无敌窗口：invulnerability flag/timer
  - 击败：`defeated` signal + `queue_free()`
- 目标是把“Boss 内部状态”和“Main 关卡规则”分清。
- 验收：
  - 能说出 Boss 自己负责什么。
  - 能说出 Main 负责什么。

## 45-70 min: 统一 Boss 伤害入口

- 检查 Boss 和 Player 接触逻辑：
  - 从上方踩踏：Boss 受伤。
  - 侧面/下方接触：Player 受伤。
- 若第24课已有逻辑，本节只整理命名与注释，不新增大结构。
- 若逻辑重复，优先用一个清晰 helper 做最小合并。
- 验收：
  - 踩踏仍扣 Boss HP。
  - 侧碰仍扣 Player HP。
  - 非 `PLAYING` 不扣血。

## 70-90 min: Boss 反馈与终态边界

- 检查 HUD：
  - Boss reward popup 是临时反馈。
  - Win/Game Over 是终态反馈。
- 确认 Boss 击败只发事件，不直接调用通关。
- 验收：
  - Boss reward 不阻塞游戏。
  - Goal 仍然是通关入口。
  - Game Over/Won 不被 Boss reward popup 覆盖。

## 90-110 min: 重开与状态恢复回归

- 固定回归路线：
  1. 进入 Boss 区。
  2. 侧碰扣血一次。
  3. 踩踏 Boss 至二阶段。
  4. 击败 Boss，看到奖励/出口解锁。
  5. 按 `R`。
  6. 确认 Boss、门、奖励、HUD 都恢复初始。
- 验收：
  - 无红色 error。
  - 重开后不会保留 Boss 已死状态。

## 110-120 min: 收尾沉淀

- 更新：`learning_kb/01_learner/daily_reports/YYYY-MM-DD.md`
- 更新：`learning_kb/01_learner/current_state.md`
- 更新：`learning_kb/01_learner/mastery_map.md` / `gap_backlog.md`

## 本课最小完成线

- 学员能解释 Boss 内部状态、Main 规则、HUD 反馈三者边界。
- Boss 伤害/受击/奖励/门控主链路不回归。
- `R` 重开能恢复 Boss encounter 初始状态。
- 无红色 error。

## 导师证据锚点

- `godot/doc/classes/Node.xml`：节点生命周期、`queue_free`、`process_mode`。
- `godot/doc/classes/Area2D.xml`：接触检测、`body_entered`。
- `godot/doc/classes/CharacterBody2D.xml`：角色碰撞与运动反馈。
- `godot/doc/classes/SceneTree.xml`：暂停与重开语义。
- `learning_kb/02_mentor/modules/M21_boss_encounter_design_and_gate_boundaries.md`
