# K015 - physics ticks and step cap coupling

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- 提高 `Engine.physics_ticks_per_second` 时，通常要同步评估 `Engine.max_physics_steps_per_frame`；否则在渲染跟不上时会出现“整体慢动作”体验。

Evidence:
- `godot/doc/classes/Engine.xml` -> `physics_ticks_per_second`
- `godot/doc/classes/Engine.xml` -> `max_physics_steps_per_frame`

Teaching Use:
- 回答“为什么我把 physics tick 调高后手感反而更怪”的高频问题。
