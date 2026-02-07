# M05 - CharacterBody2D Movement Basics

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-06
Compatibility: unchanged

## Core Conclusion

- `CharacterBody2D` 以 `velocity` 属性 + `move_and_slide()` 为核心；地面判定（如 `is_on_floor()`）依赖最近一次运动求解结果。

## Evidence

- Source: `godot/scene/2d/physics/character_body_2d.cpp`
  - 运动入口：`CharacterBody2D::move_and_slide()`
  - 速度读写：`set_velocity` / `get_velocity`
  - 地面状态：`is_on_floor` / `is_on_floor_only`
  - 对外方法绑定：`CharacterBody2D::_bind_methods()`

## Teaching Use

- Day 2 教学时强调顺序：
  1. 更新 `velocity`（含重力）
  2. 调 `move_and_slide()`
  3. 再读 `is_on_floor()` 做跳跃/落地逻辑

## Fast Answer Snippet

- `is_on_floor()` 是运动后状态，不应在本帧运动前当作最终判定。
