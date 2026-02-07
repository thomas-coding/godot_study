# M05 - CharacterBody2D Movement Basics

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

## Core Conclusion

- `CharacterBody2D` 以 `velocity` 属性 + `move_and_slide()` 为核心；地面判定（如 `is_on_floor()`）依赖最近一次运动求解结果。
- `move_and_slide()` 推荐在 `_physics_process` 调用；`velocity` 单位是 px/s，不应额外乘 `delta`。

## Day 2 Teaching Checklist (Minimal Playable)

1. 节点：`Player` 使用 `CharacterBody2D`（含可碰撞形状）。
2. 输入：`move_left`/`move_right`/`jump` 已在 InputMap 建好。
3. 回调：运动主逻辑放 `_physics_process(delta)`。
4. 顺序：先更新 `velocity`（输入 + 重力）-> 调 `move_and_slide()` -> 再读 `is_on_floor()`。
5. 验收：可稳定左右移动、起跳、落地，且下坡无明显离地抖动。

## Common Pitfalls

- 把 `velocity` 当作位移向量并乘了 `delta`。
- 在 `move_and_slide()` 前读取 `is_on_floor()` 作为最终状态。
- 把运动主逻辑长期放在 `_process` 导致手感与帧率相关。
- 下坡贴地不稳却未检查 `floor_snap_length`。

## Evidence

- Source: `godot/scene/2d/physics/character_body_2d.cpp`
  - 运动入口：`CharacterBody2D::move_and_slide()`
  - delta 选择：`Engine::is_in_physics_frame()` 分支
  - 速度读写：`set_velocity` / `get_velocity`
  - floor snap：`_apply_floor_snap`, `set_floor_snap_length`
  - 地面状态：`is_on_floor` / `is_on_floor_only`
  - 对外方法绑定：`CharacterBody2D::_bind_methods()`
- Class docs: `godot/doc/classes/CharacterBody2D.xml`
  - `move_and_slide`（推荐 `_physics_process`）
  - `velocity`（px/s 与常见错误）
  - `floor_snap_length`, `safe_margin`（贴地与碰撞恢复）

## Teaching Use

- Day 2 教学时强调顺序：
  1. 更新 `velocity`（含重力）
  2. 调 `move_and_slide()`
  3. 再读 `is_on_floor()` 做跳跃/落地逻辑
- 排错时可直接配合模板：`04_templates/characterbody2d_day2_troubleshooting_checklist.md`

## Fast Answer Snippet

- `is_on_floor()` 是运动后状态，不应在本帧运动前当作最终判定。
- Day 2 默认脚手架：`_physics_process` + px/s velocity + `move_and_slide()` 后读接触状态。
