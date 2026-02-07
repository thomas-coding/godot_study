# K027 - ProjectSettings max_fps is startup-only

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- `application/run/max_fps` 只在项目启动时读取；运行时应改 `Engine.max_fps`。

Evidence:
- `godot/doc/classes/ProjectSettings.xml` -> `application/run/max_fps`（startup-only + runtime note）
- `godot/doc/classes/Engine.xml` -> `max_fps`

Teaching Use:
- 用于排查“运行时改 ProjectSettings 但 FPS 上限没变化”的常见误区。
