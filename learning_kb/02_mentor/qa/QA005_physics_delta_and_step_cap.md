# QA005 - physics delta and step cap

Question:
- `_physics_process(delta)` 的 `delta` 为什么有时看起来不等于真实经过时间？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 逻辑上，`_physics_process(delta)` 对应固定物理步长，基础值由 `Engine.time_scale / Engine.physics_ticks_per_second` 决定。
- 但在低帧率或卡顿时，引擎会用 `max_physics_steps_per_frame` 限制每帧物理步次数，避免 spiral of death。
- 结果是：`delta` 可用于运动积分，但不适合精确计量“现实秒数”；计时应使用 `Time` 单例。

Evidence:
- `godot/doc/classes/Node.xml` -> `_physics_process` 描述
- `godot/doc/classes/Node.xml` -> `get_physics_process_delta_time` 说明（step cap 与 spiral of death）
- `godot/main/main.cpp` -> `Main::iteration`（`physics_ticks_per_second`、`max_physics_steps_per_frame`、physics step loop）
