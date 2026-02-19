# K049 - Changing Area2D monitoring during in/out signal requires deferred

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-18
Compatibility: unchanged

Conclusion:
- 在 in/out 信号回调中直接切 `monitoring/monitorable` 会触发保护错误；应使用 `set_deferred(...)`。

Evidence:
- `godot/scene/2d/physics/area_2d.cpp` -> `Area2D::set_monitoring`, `Area2D::set_monitorable`（`ERR_FAIL_COND_MSG`）

Teaching Use:
- 用于修复“body_entered 里直接关 monitoring 报错”的时序问题。
