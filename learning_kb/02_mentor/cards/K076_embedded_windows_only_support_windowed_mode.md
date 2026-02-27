# K076 - Embedded windows only support windowed mode

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-27
Compatibility: unchanged

Conclusion:
- 当窗口是嵌入子窗口时，`window_set_mode` 对 `fullscreen/borderless` 会被平台层拒绝，仅支持 `windowed`。

Evidence:
- `godot/platform/windows/display_server_windows.cpp` -> `DisplayServerWindows::window_set_mode`
- `godot/platform/linuxbsd/x11/display_server_x11.cpp` -> `DisplayServerX11::window_set_mode`

Teaching Use:
- 用于解释“模式日志变化但画面不变”的高频现象，指导学员先切独立窗口复测。
