# QA008 - camera follow jitter from callback mismatch

Question:
- 玩家移动写在 `_physics_process`，但 Camera2D 跟随还是抖，常见原因是什么？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 第一怀疑点是更新域不一致：玩家在 physics 更新，相机却在 idle 更新（或反过来）。
- 先把 Camera2D `process_callback` 与目标更新节奏对齐，再调 smoothing。
- 若调参后仍有延迟残留，调用 `reset_smoothing()` 做一次“立即收敛”验证。

Evidence:
- `godot/doc/classes/Camera2D.xml` -> `process_callback`, `reset_smoothing`
- `godot/scene/2d/camera_2d.cpp` -> `_update_process_callback`, `_notification`
