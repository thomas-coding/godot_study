# 第24课 - 2h Runbook（Boss 战能力补齐与区域门控）

目标：在 2 小时内把当前 Boss 从“可被击败的奖励目标”升级为“有威胁、有区域边界、有出口反馈”的小型战斗段，并保持第22/23课建立的 alpha 与导出回归口径。

## 本课唯一目标（英文）

`Today I will turn the Boss reward target into a small gated combat encounter with contact damage and a clear exit unlock.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行项目：确认第22/23课后的 alpha route 或导出 dry-run 基线可用。
- 快速回归：
  - start
  - pause/resume
  - restart
  - coin/score/Goal
  - event/wave/gate
  - Boss reward popup

## 10-25 min: 固定 Boss 战设计边界

- 本课只做最小 Boss encounter，不做完整 Boss 设计。
- 推荐范围：
  1. Boss 接触玩家造成伤害。
  2. Boss 只在 Boss 区域内巡逻。
  3. Boss 击败后打开出口门或显示出口解锁反馈。
  4. Boss 奖励仍然只是分数奖励，不直接通关。
- 明确不做：
  - 不做复杂 AI。
  - 不做多种弹幕。
  - 不做完整动画状态机。
  - 不改 Steam/导出目标。

## 25-45 min: Boss 接触伤害

- 在 `boss.gd` 中新增 `hit_player` 信号或复用 Boss `Hitbox` 的接触检测。
- 判定规则：
  - 玩家从上方下落踩踏时：Boss 受伤。
  - 玩家侧面/下方接触 Boss 时：玩家受伤。
- `Main` 接收 Boss 伤害信号后复用 `_on_hazard_hit()` 或 `_on_enemy_hit_player()`。
- 验收：
  - 从上方踩 Boss：Boss 扣 HP。
  - 侧面碰 Boss：玩家扣 HP。
  - 终态/非 PLAYING 不扣血。

## 45-65 min: Boss 区域门控

- 在 Boss 区域前后放置最小门控节点：
  - `BossGate(StaticBody2D)` 或复用现有门控模式。
  - Boss 未击败前阻挡出口。
  - Boss 击败后移除/隐藏门。
- 推荐先做单门出口，不做双门封锁。
- 验收：
  - Boss 未死前出口不能直接通过。
  - Boss 死亡后出口打开。
  - `R` 重开后门恢复。

## 65-85 min: 可选二阶段攻击

- 若前两段顺利，再做最小二阶段投射物。
- 推荐方案：
  - Boss 在 `PHASE_2` 时按固定冷却发射已有 `projectile.tscn`。
  - 复用第17课 projectile 伤害链路。
- 若时间不足，记录为 P1，不强行塞进本课。

## 85-105 min: 回归验证

- 固定路线：
  1. `Enter` 开始。
  2. 触发波次并清门。
  3. 进入 Boss 区。
  4. 测 Boss 侧碰伤害。
  5. 踩 Boss 到二阶段。
  6. 击败 Boss，奖励只发一次。
  7. 出口打开。
  8. 到达 Goal 才通关/切关。
  9. `P` 暂停/恢复不破坏战斗状态。
  10. `R` 重开恢复 Boss、门、奖励、HUD。

## 105-120 min: 收尾沉淀

- 更新：`learning_kb/01_learner/daily_reports/YYYY-MM-DD.md`
- 更新：`learning_kb/01_learner/current_state.md`
- 更新：`learning_kb/01_learner/mastery_map.md` / `gap_backlog.md`
- 更新：`learning_kb/03_sessions/handoff_latest.md`

## 本课最小完成线

- Boss 侧碰能让玩家受伤。
- Boss 踩踏受伤逻辑不回归。
- Boss 击败后奖励只发一次。
- Boss 击败后打开出口或清除 Boss 门。
- Goal 仍然是最终通关入口。
- `R` 重开后 Boss、门、奖励、HUD 都恢复初始。
- 无红色 error。

## 导师证据锚点

- `godot/doc/classes/Area2D.xml`：接触检测、`body_entered` 与监测语义。
- `godot/doc/classes/CharacterBody2D.xml`：运动与碰撞反馈。
- `godot/doc/classes/Node.xml`：`process_mode`、`queue_free`、组与生命周期。
- `godot/doc/classes/SceneTree.xml`：暂停、重开、组计数与场景状态。
- `learning_kb/02_mentor/modules/M21_boss_encounter_design_and_gate_boundaries.md`
