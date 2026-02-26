# QA066 - Why does changing Master volume do nothing?

Question:
- 我改了 Master 音量但没效果，最常见原因是什么？

Version Scope: 4.6
Last Verified: 2026-02-25
Compatibility: unchanged

Answer (teaching-ready):
- 先检查 `AudioServer.get_bus_index("Master")` 返回值；若是 `-1`，说明总线名不存在（常见是拼写不一致）。
- 只有合法 `bus_idx` 才能被 `set_bus_volume_db/linear` 正常应用。

Evidence:
- `godot/doc/classes/AudioServer.xml` -> `get_bus_index`, `set_bus_volume_db`
- `godot/servers/audio/audio_server.cpp` -> `AudioServer::get_bus_index`
