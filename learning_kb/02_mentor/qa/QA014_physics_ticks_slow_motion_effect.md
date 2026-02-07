# QA014 - why higher physics ticks can still feel slower

Question:
- 我把 `physics_ticks_per_second` 提高后，为什么有时反而像慢动作？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 提高 physics tick 后，每渲染帧需要补的物理步数也会增加；若受 `max_physics_steps_per_frame` 上限约束，项目会表现为“跟不上真实时间”的慢动作感。
- 调参要联动：`physics_ticks_per_second`、`max_physics_steps_per_frame`、`max_fps`，并结合 profile 数据看 CPU 是否已到瓶颈。

Evidence:
- `godot/doc/classes/Engine.xml` -> `physics_ticks_per_second`
- `godot/doc/classes/Engine.xml` -> `max_physics_steps_per_frame`
