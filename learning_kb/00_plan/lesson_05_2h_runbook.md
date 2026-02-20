# 第5课 - 2h Runbook（hazard 伤害交互 + 失败重开闭环）

目标：在 2 小时内在现有收集玩法上增加一个 `Area2D` 危险区（hazard），形成“受伤/失败/重开”的最小闭环。

## 本课唯一目标（英文）

`Today I will add one hazard Area2D and complete a minimal damage-to-restart gameplay loop.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行项目：确认第4课结果可用（start/play/pause/restart）。

## 10-35 min: 创建 Hazard 场景

- 新建 `Hazard` 场景：根节点 `Area2D`。
- 子节点：`CollisionShape2D` + `Sprite2D`（或 `Polygon2D` 占位）。
- 保存：`projects/first-game/scenes/hazard.tscn`。

## 35-65 min: 建立伤害信号

- `hazard.gd` 监听 `body_entered`。
- 当 `Player` 进入时，发射 `hit` 信号（参数可选：damage=1）。
- 在 `Main` 中连接 `hit`，维护 `hp`（例如 3 -> 0）。

## 65-90 min: 失败与重开闭环

- `hp <= 0` 时显示 `Game Over` 提示。
- 保持 `R` 可重开：重置场景、重置 `hp` 与分数。
- 若正在暂停，先取消暂停再重开。

## 90-105 min: layer/mask 与冲突排查

- 明确并验证：`Hazard` 只检测 `Player` 层。
- 防止重复伤害：
  - 可在命中后短暂禁监控，或
  - 通过最小冷却变量避免同帧多次扣血。

## 105-120 min: 收尾沉淀

- 更新：`learning_kb/01_learner/daily_reports/YYYY-MM-DD.md`
- 更新：`learning_kb/01_learner/current_state.md`
- 更新：`learning_kb/01_learner/mastery_map.md` / `learning_kb/01_learner/gap_backlog.md`
- 更新：`learning_kb/03_sessions/handoff_latest.md`

## 本课最小完成线

- `Player` 进入 `Hazard(Area2D)` 可触发扣血。
- 血量归零后能看到失败提示。
- `R` 重开可恢复初始状态，无红色报错。
