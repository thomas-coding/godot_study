# K068 - set_bus_volume_linear maps to dB internally

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-25
Compatibility: unchanged

Conclusion:
- `AudioServer.set_bus_volume_linear` 底层等价于 `linear_to_db` 后再调用 `set_bus_volume_db`，滑条可直接保存线性值。

Evidence:
- `godot/doc/classes/AudioServer.xml` -> `set_bus_volume_linear`
- `godot/doc/classes/@GlobalScope.xml` -> `linear_to_db`
- `godot/servers/audio/audio_server.cpp` -> `AudioServer::set_bus_volume_linear`

Teaching Use:
- 用于指导“UI 用 0..1，内部自动转 dB”的最小实现口径。
