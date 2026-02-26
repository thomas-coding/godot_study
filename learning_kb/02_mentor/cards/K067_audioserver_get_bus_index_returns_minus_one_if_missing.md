# K067 - AudioServer.get_bus_index returns -1 for missing bus

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-25
Compatibility: unchanged

Conclusion:
- `AudioServer.get_bus_index(bus_name)` 在找不到总线时返回 `-1`，运行时设置音量前必须先做索引有效性判断。

Evidence:
- `godot/doc/classes/AudioServer.xml` -> `get_bus_index`
- `godot/servers/audio/audio_server.cpp` -> `AudioServer::get_bus_index`

Teaching Use:
- 用于课堂里解释“为什么改音量没效果”：常见是总线名拼错导致索引无效。
