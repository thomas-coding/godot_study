# K008 - Camera2D process callback alignment

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- `Camera2D` 跟随目标时，`process_callback`（Physics/Idle）应尽量与目标位移更新节奏对齐；不对齐是抖动高频来源。

Evidence:
- `godot/doc/classes/Camera2D.xml` -> `process_callback`（`CAMERA2D_PROCESS_PHYSICS` / `CAMERA2D_PROCESS_IDLE`）
- `godot/scene/2d/camera_2d.cpp` -> `Camera2D::_update_process_callback`
- `godot/scene/2d/camera_2d.cpp` -> `Camera2D::_notification`（`NOTIFICATION_INTERNAL_PROCESS` / `NOTIFICATION_INTERNAL_PHYSICS_PROCESS`）

Teaching Use:
- 回答“相机为什么跟随抖动”时先检查玩家与相机是否处于同一更新域。
