# CharacterBody2D Day2 Troubleshooting Checklist (Godot 4.6)

用途：Day 2 最小移动/跳跃实现时，按顺序排查输入、重力、碰撞、地面判定问题。

## 0) Baseline checks

- 引擎版本：确认为 `Godot 4.6 stable`。
- 节点类型：角色节点必须是 `CharacterBody2D`。
- 回调位置：核心运动逻辑默认放 `_physics_process(delta)`。

## 1) Input checks

- Input Map 是否存在：`move_left`, `move_right`, `jump`。
- 拼写是否一致：代码 action 名与 Project Settings 完全一致。
- 最小验证：先打印 `Input.is_action_just_pressed("jump")`。

## 2) Velocity and units checks

- `velocity` 单位是 px/s，不要把目标速度再乘 `delta`。
- 重力积分只在 Y 轴累加，且每帧只累加一次。
- 水平输入建议先算目标速度，再赋给 `velocity.x`。

## 3) move_and_slide order checks

- 推荐顺序：
  1. 更新 `velocity`（输入 + 重力）
  2. 调 `move_and_slide()`
  3. 再读 `is_on_floor()` 处理跳跃/落地
- 若在 `_process` 调用，先改到 `_physics_process` 再观察手感。

## 4) Floor and collision checks

- `is_on_floor()` 只代表“上一次 move_and_slide 后”的状态。
- `up_direction` 不能是 `Vector2.ZERO`（除非你改为 floating 语义）。
- 下坡贴地不稳时，优先检查 `floor_snap_length` 是否为 0。

## 5) Typical symptom mapping

- 症状：跳不起来
  - 检查点：`is_on_floor()` 读取时机、`jump` action 拼写、`velocity.y` 方向符号。
- 症状：移动很慢
  - 检查点：是否对 `velocity` 额外乘了 `delta`。
- 症状：下坡抖动/离地
  - 检查点：`floor_snap_length`、`floor_stop_on_slope`、物理步长设置。

## Evidence anchors

- `godot/doc/classes/CharacterBody2D.xml`
- `godot/doc/classes/Node.xml`
- `godot/scene/2d/physics/character_body_2d.cpp`
- `godot/main/main.cpp`
