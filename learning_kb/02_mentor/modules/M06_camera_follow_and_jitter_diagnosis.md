# M06 - Camera2D Follow and Jitter Diagnosis

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

## Core Conclusion

- Camera 跟随抖动的高频根因是“目标更新节奏”和“Camera 更新节奏”不一致。
- `Camera2D` 的实际屏幕中心不等于 `global_position`，受 smoothing/limit/drag 影响，诊断应读 `get_screen_center_position()`。
- 运行时调整平滑或限制后，如需立即收敛，可用 `reset_smoothing()` / `force_update_scroll()`。

## Evidence

- Class docs: `godot/doc/classes/Camera2D.xml`
  - `process_callback`（Physics/Idle）
  - `get_screen_center_position` 与 `global_position` 差异说明
  - `position_smoothing_enabled`, `position_smoothing_speed`, `reset_smoothing`, `force_update_scroll`
- Source: `godot/scene/2d/camera_2d.cpp`
  - 回调模式切换：`Camera2D::_update_process_callback`
  - 平滑 delta 来源：`Camera2D::get_camera_transform`（physics/idle 分支）
  - 内部通知：`Camera2D::_notification`（`NOTIFICATION_INTERNAL_PROCESS` / `NOTIFICATION_INTERNAL_PHYSICS_PROCESS`）
  - 立即更新：`Camera2D::force_update_scroll`, `Camera2D::reset_smoothing`

## Teaching Use

- 相机抖动排查默认顺序：
  1. 先确认目标（Player）主要在 `_physics_process` 还是 `_process` 更新。
  2. Camera `process_callback` 对齐同一节奏（平台类建议 Physics）。
  3. 观察 `get_screen_center_position()`，不要只看 `global_position`。
  4. 调参后如出现拖尾残留，用 `reset_smoothing()` 快速验证。

## Fast Answer Snippet

- 角色 physics 更新 + Camera idle 更新，最容易出现跟随抖动；优先对齐到同一更新域。
