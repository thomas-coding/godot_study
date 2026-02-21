# 第10课 - 2h Runbook（敌人巡逻 + 接触伤害）

目标：在 2 小时内加入一个可巡逻的敌人，并与现有状态机/HUD 体系完成接触伤害闭环。

## 本课唯一目标（英文）

`Today I will add one patrol enemy and integrate contact damage into the existing state-driven gameplay loop.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行项目：确认第9课基线可用（Camera + 状态机 + HUD）。

## 10-35 min: 新建 Enemy 场景

- 新建 `Enemy` 场景：根节点 `CharacterBody2D`（或 `Node2D + Area2D`，二选一，推荐前者）。
- 添加 `CollisionShape2D` + `Sprite2D`。
- 保存：`projects/first-game/scenes/enemy.tscn`。

## 35-65 min: 实现巡逻逻辑

- `enemy.gd` 实现最小巡逻：
  - 两点往返（left/right 边界）
  - 到边界翻转方向
- 保持速度常量，先不做复杂 AI。

## 65-90 min: 接触伤害接线

- 方案建议：
  - Enemy 提供 `hit_player` 信号，或
  - 用现有伤害接口复用到 `Main` 的 `hp` 逻辑。
- 要求：仅在 `PLAYING` 状态扣血，终态不再扣血。

## 90-105 min: 稳定性与回归

- 验证：
  1. 敌人巡逻可见且方向切换正常
  2. 接触敌人会扣血
  3. `GAME_OVER/WON` 后不再触发伤害
  4. `R` 重开后敌人与状态恢复初始

## 105-120 min: 收尾沉淀

- 更新：`learning_kb/01_learner/daily_reports/YYYY-MM-DD.md`
- 更新：`learning_kb/01_learner/current_state.md`
- 更新：`learning_kb/01_learner/mastery_map.md` / `learning_kb/01_learner/gap_backlog.md`
- 更新：`learning_kb/03_sessions/handoff_latest.md`

## 本课最小完成线

- 至少 1 个敌人可巡逻并造成接触伤害。
- 与现有状态机/HUD 无冲突。
- 运行无红色报错。
