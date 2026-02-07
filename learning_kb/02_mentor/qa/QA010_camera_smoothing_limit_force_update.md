# QA010 - camera smoothing and limit update timing

Question:
- 我改了 Camera2D 的 smoothing/limit 参数，但画面没有立刻到预期位置，怎么快速验证？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 先区分“目标位置”与“当前屏幕中心”：查看 `get_target_position()` 和 `get_screen_center_position()`。
- 若希望立即更新滚动结果，用 `force_update_scroll()`；若希望清掉平滑拖尾，用 `reset_smoothing()`。
- 若启用了 `limit_smoothed`，可先临时关闭或 reset 后再观察 limit 行为。

Evidence:
- `godot/doc/classes/Camera2D.xml` -> `get_target_position`, `get_screen_center_position`, `force_update_scroll`, `reset_smoothing`, `limit_smoothed`
- `godot/scene/2d/camera_2d.cpp` -> `Camera2D::force_update_scroll`, `Camera2D::reset_smoothing`, `Camera2D::get_camera_transform`
