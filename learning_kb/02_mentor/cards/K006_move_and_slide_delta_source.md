# K006 - move_and_slide delta source

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- `CharacterBody2D.move_and_slide()` 会根据当前帧类型自动选 `delta`（physics 帧用 `get_physics_process_delta_time()`，否则用 `get_process_delta_time()`），但官方仍建议放在 `_physics_process`。

Evidence:
- `godot/scene/2d/physics/character_body_2d.cpp` -> `CharacterBody2D::move_and_slide`（`Engine::is_in_physics_frame()` 分支）
- `godot/doc/classes/CharacterBody2D.xml` -> `move_and_slide` 描述（应在 `Node._physics_process` 中使用）

Teaching Use:
- 用于解释“为什么在 `_process` 调 move_and_slide 可能手感不稳”，并给出统一默认实践。
