# QA080 - How to verify volume setting when the project has no audio assets?

Question:
- 项目里没有音频素材时，如何验证音量设置链路真的生效？

Version Scope: 4.6
Last Verified: 2026-02-27
Compatibility: unchanged

Answer (teaching-ready):
- 用“可观测链路”验收：
  1. 输出 slider 线性值与目标 dB 值
  2. 调用 `AudioServer.set_bus_volume_db`（或线性接口）
  3. 同步写入持久层并重启回放验证
- 关键结论：`set_bus_volume_linear` 本质会做 `linear_to_db` 转换并落到 dB 接口。

Evidence:
- `godot/doc/classes/AudioServer.xml` -> `set_bus_volume_linear`, `set_bus_volume_db`
- `godot/servers/audio/audio_server.cpp`
