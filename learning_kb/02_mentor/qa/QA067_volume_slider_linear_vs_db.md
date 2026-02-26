# QA067 - Should volume sliders store linear values or dB?

Question:
- 设置菜单的音量滑条应该保存线性值还是 dB？

Version Scope: 4.6
Last Verified: 2026-02-25
Compatibility: unchanged

Answer (teaching-ready):
- 教学项目优先保存线性值（`0..1`），UI 直观且便于序列化。
- 应用时可直接 `set_bus_volume_linear`，或先 `linear_to_db` 再 `set_bus_volume_db`，两者语义等价。

Evidence:
- `godot/doc/classes/AudioServer.xml` -> `set_bus_volume_linear`, `set_bus_volume_db`
- `godot/doc/classes/@GlobalScope.xml` -> `linear_to_db`
- `godot/servers/audio/audio_server.cpp` -> `AudioServer::set_bus_volume_linear`
