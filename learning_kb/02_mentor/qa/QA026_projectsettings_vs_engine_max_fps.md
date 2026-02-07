# QA026 - ProjectSettings max_fps vs Engine.max_fps

Question:
- 为什么我在运行时改 `ProjectSettings.application/run/max_fps` 没效果？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 这是预期行为：`application/run/max_fps` 只在启动时读取。
- 运行时调整帧率上限，请使用 `Engine.max_fps`。
- 同时注意 V-Sync 优先级，避免误判 FPS cap 行为。

Evidence:
- `godot/doc/classes/ProjectSettings.xml` -> `application/run/max_fps`
- `godot/doc/classes/Engine.xml` -> `max_fps`
