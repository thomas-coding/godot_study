# K048 - Area2D monitoring and monitorable are separate gates

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-18
Compatibility: unchanged

Conclusion:
- `monitoring` 是“我是否检测别人”，`monitorable` 是“我是否可被其他 Area 检测”，两者语义不同。

Evidence:
- `godot/doc/classes/Area2D.xml` -> `monitoring`, `monitorable`
- `godot/scene/2d/physics/area_2d.cpp` -> `Area2D::set_monitoring`, `Area2D::set_monitorable`

Teaching Use:
- 用于排查 Area 对 Area 不触发时的误配置。
