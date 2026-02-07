# K009 - Camera2D screen center vs global position

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- `Camera2D.global_position` 不是最终屏幕中心；启用 smoothing/limit/drag 后，诊断应使用 `get_screen_center_position()`。

Evidence:
- `godot/doc/classes/Camera2D.xml` -> 类描述与 `get_screen_center_position` 说明
- `godot/doc/classes/Camera2D.xml` -> `get_target_position` 与 `global_position` 差异说明

Teaching Use:
- 用于修正“我打印 camera position 看起来没问题但画面在抖”的误判。
