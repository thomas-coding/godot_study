# QA007 - move_and_slide speed mismatch

Question:
- 为什么我按教程写了 `move_and_slide()`，但角色速度不对（太慢/太快）？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 先检查两件事：
  1. `velocity` 是否被错误地乘了 `delta`（它应是 px/s，而不是 px）。
  2. `move_and_slide()` 是否在 `_physics_process`（推荐）里调用。
- 典型正确顺序：更新 `velocity`（重力/输入） -> `move_and_slide()` -> 读取 `is_on_floor()`。

Evidence:
- `godot/doc/classes/CharacterBody2D.xml` -> `velocity` 成员说明（常见错误提醒）
- `godot/doc/classes/CharacterBody2D.xml` -> `move_and_slide` 描述（推荐在 `_physics_process`）
- `godot/scene/2d/physics/character_body_2d.cpp` -> `CharacterBody2D::move_and_slide`
