# K069 - window_set_mode is the runtime entrypoint for window mode

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-25
Compatibility: unchanged

Conclusion:
- 运行时切窗口模式的底层入口是 `DisplayServer.window_set_mode`，模式枚举包含 `WINDOWED/FULLSCREEN/EXCLUSIVE_FULLSCREEN`。

Evidence:
- `godot/doc/classes/DisplayServer.xml` -> `window_set_mode`, `WINDOW_MODE_*`
- `godot/servers/display/display_server.h` -> `WindowMode`
- `godot/servers/display/display_server.cpp` -> bind for `window_set_mode/window_get_mode`

Teaching Use:
- 用于第14课窗口设置入口解释，避免把窗口切换逻辑分散到平台特例前就过早复杂化。
