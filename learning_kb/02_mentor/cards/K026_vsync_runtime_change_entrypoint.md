# K026 - runtime V-Sync change entrypoint

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- `display/window/vsync/vsync_mode` 只在项目启动时读取；运行时改 V-Sync 应调用 `DisplayServer.window_set_vsync_mode()`。

Evidence:
- `godot/doc/classes/ProjectSettings.xml` -> `display/window/vsync/vsync_mode`（startup-only + runtime note）
- `godot/doc/classes/DisplayServer.xml` -> `window_set_vsync_mode`

Teaching Use:
- 解释“运行时改项目设置但 V-Sync 不变化”的配置误区。
