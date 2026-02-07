# QA023 - runtime V-Sync change has no effect

Question:
- 我运行时改了 `ProjectSettings.display/window/vsync/vsync_mode`，为什么没效果？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 因为这个项目设置只在启动时读取。
- 运行时改 V-Sync 要用 `DisplayServer.window_set_vsync_mode()`。
- 同时注意渲染方法兼容性：某些 V-Sync 模式在 Compatibility 渲染器不支持。

Evidence:
- `godot/doc/classes/ProjectSettings.xml` -> `display/window/vsync/vsync_mode`
- `godot/doc/classes/DisplayServer.xml` -> `window_set_vsync_mode`
