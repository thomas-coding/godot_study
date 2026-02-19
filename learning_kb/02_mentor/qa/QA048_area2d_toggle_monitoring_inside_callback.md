# QA048 - Toggling Area2D monitoring inside callback causes error

Question:
- 为什么我在 `body_entered` 里直接 `set_monitoring(false)` 会报错？

Version Scope: 4.6
Last Verified: 2026-02-18
Compatibility: unchanged

Answer (teaching-ready):
- in/out 信号执行期间有重入保护，直接改 monitoring/monitorable 会被阻止。
- 改为 `set_deferred("monitoring", false)` 或 `set_deferred("monitorable", false)`。
- 这是为了避免在查询刷新过程中修改监控状态导致不一致。

Evidence:
- `godot/scene/2d/physics/area_2d.cpp` -> `Area2D::set_monitoring`, `Area2D::set_monitorable`
