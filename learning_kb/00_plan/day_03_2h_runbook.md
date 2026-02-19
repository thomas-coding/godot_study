# Day 03 - 2h Runbook (Area2D interaction + minimal loop)

目标：在 2 小时内基于 Day2 的 `Player` 移动能力，完成一个最小可交互玩法（可收集物触发 + 计数反馈）。

## 今日唯一目标（英文）

`Today I will add one Area2D interaction and complete a minimal collect-and-count gameplay loop.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行当前项目：确认 Day2 基线可用（A/D 移动 + Space 跳跃）。

## 10-35 min: 创建可收集物场景

- 新建 `Coin` 场景：根节点 `Area2D`。
- 子节点：
  - `CollisionShape2D`（`CircleShape2D` 或 `RectangleShape2D`）
  - `Sprite2D`（可视化）
- 保存：`projects/first-game/scenes/coin.tscn`

## 35-65 min: 建立 Area2D 交互

- 给 `Coin` 挂脚本 `coin.gd`：监听 `body_entered`。
- 进入者是 `Player` 时：
  1. 发射 `collected` 信号（可选）
  2. `queue_free()` 回收
- 在 `Main` 场景实例化 1-3 个 `Coin` 进行验证。

## 65-90 min: 最小计数反馈

- 在 `main.gd` 里维护 `score` 或 `collected_count`。
- 收集成功后计数 +1，并打印或显示到一个简单 `Label`。
- 保持最小实现，不做复杂 UI 动画。

## 90-105 min: 排错与稳定化

- 若 `body_entered` 不触发，按顺序排查：
  1. `Area2D.monitoring` 是否为 `true`
  2. `CollisionShape2D` 是否存在且启用
  3. `collision_layer/mask` 是否互相可见
  4. 是否误在回调中直接修改监控状态（需要 `set_deferred`）

## 105-120 min: 收尾沉淀

- 更新：`learning_kb/01_learner/daily_reports/YYYY-MM-DD.md`
- 更新：`learning_kb/01_learner/current_state.md`
- 更新：`learning_kb/01_learner/mastery_map.md` / `learning_kb/01_learner/gap_backlog.md`
- 更新：`learning_kb/03_sessions/handoff_latest.md`

## 今日最小完成线

- `Player` 能触发 `Area2D` 的 `body_entered`。
- 收集物被回收（`queue_free`）且计数 +1。
- 运行时无红色报错。

## 如果中途卡住（直接问 AI）

```text
我在 Day3 的 Area2D 交互卡住了，请按最小修复给我步骤。

Context:
- Symptom: （例如“碰到了但 body_entered 不触发”）
- What I tried: （你试过的步骤）

Please provide:
1) Root cause
2) Minimal fix steps
3) Verify checklist
```
