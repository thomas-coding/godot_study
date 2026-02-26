# QA068 - Why does window style look different after leaving fullscreen?

Question:
- 切到全屏再退回窗口后，为什么窗口边框样式看起来变了？

Version Scope: 4.6
Last Verified: 2026-02-25
Compatibility: unchanged

Answer (teaching-ready):
- `window_set_mode(FULLSCREEN/EXCLUSIVE_FULLSCREEN)` 会强制 borderless。
- 退回窗口模式后，如需固定样式，应该显式恢复窗口标志，而不是假设会自动回到原样。

Evidence:
- `godot/doc/classes/DisplayServer.xml` -> `window_set_mode` note
- `godot/servers/display/display_server.h` -> `WindowMode`
- `godot/platform/windows/display_server_windows.cpp` -> `DisplayServerWindows::window_set_mode`
