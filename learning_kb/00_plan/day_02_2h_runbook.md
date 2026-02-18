# Day 02 - 2h Runbook (CharacterBody2D minimal playable)

目标：在 2 小时内完成 `Player` 最小可玩（左右移动 + 跳跃 + 地面碰撞），并形成可复用调试习惯。

## 今日唯一目标（英文）

`Today I will build a minimal CharacterBody2D player with left/right movement and jump.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并快速浏览：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 确认 Input Map 已有：`move_left`, `move_right`, `jump`。

## 10-35 min: 搭建最小场景结构

- 新建 `Player` 场景：根节点 `CharacterBody2D`。
- 子节点：
  - `CollisionShape2D`（先用 `RectangleShape2D`）
  - `Sprite2D`（可选，用色块占位也行）
- 保存：`projects/first-game/scenes/player.tscn`
- 在 `Main` 场景加入地面：`StaticBody2D + CollisionShape2D`。
- 在 `Main` 场景实例化 `Player`。

## 35-70 min: 实作移动与跳跃脚本

- 新建脚本：`projects/first-game/scenes/player.gd`
- 核心逻辑顺序：
  1. 非落地时施加重力
  2. 读取左右输入并写入 `velocity.x`
  3. 仅在 `is_on_floor()` 时允许跳跃
  4. `move_and_slide()`
- 注意：`velocity` 单位是像素/秒，`_physics_process` 里不要对 `velocity.x` 再乘 `delta`。

## 70-95 min: 运行验证与参数调节

- 运行（`F5`）后完成三项验证：
  - A/D 能左右移动
  - Space 仅落地可跳
  - 空中不能二段跳（当前阶段）
- 调参数：
  - `speed`（建议 180~260）
  - `jump_velocity`（建议 -360~-480）

## 95-110 min: 最小排错

- 若角色不动：先查 `Input Map` 名称是否完全一致。
- 若角色穿地：先查地面与玩家是否都有 `CollisionShape2D`。
- 若跳跃失效：打印 `is_on_floor()` 与 `velocity.y` 看时序。

## 110-120 min: 收尾沉淀

- 更新：`learning_kb/01_learner/daily_reports/YYYY-MM-DD.md`
- 更新：`learning_kb/01_learner/current_state.md`
- 更新：`learning_kb/01_learner/mastery_map.md` / `learning_kb/01_learner/gap_backlog.md`
- 在 `learning_kb/03_sessions/handoff_latest.md` 记录 Day2 实作进度。

## 今日最小完成线

- `Player` 能左右移动。
- `Player` 能跳跃并受重力影响。
- 地面碰撞稳定，不穿透。

## 如果中途卡住（直接问 AI）

```text
我在 Day2 的 CharacterBody2D 移动/跳跃卡住了，请按最小修复给我步骤。

Context:
- Symptom: （例如“能移动但不能跳”）
- What I tried: （你试过的步骤）

Please provide:
1) Root cause
2) Minimal fix steps
3) Verify checklist
```
