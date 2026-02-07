# K004 - CharacterBody2D move_and_slide API

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-06
Compatibility: unchanged

Conclusion:
- `CharacterBody2D` 的基本运动模型是“更新 velocity -> 调 move_and_slide -> 读取接触状态（如 is_on_floor）”。

Evidence:
- `godot/scene/2d/physics/character_body_2d.cpp` -> `move_and_slide`, `is_on_floor`

Teaching Use:
- Day 2 起步模板和跳跃逻辑顺序讲解。
