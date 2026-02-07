# K022 - DisplayServer refresh rate fallback

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- `DisplayServer.screen_get_refresh_rate()` 可能返回 `-1.0`（无效屏幕或平台不支持），调优逻辑必须有回退值（如 60Hz）。

Evidence:
- `godot/doc/classes/DisplayServer.xml` -> `screen_get_refresh_rate`（返回 `-1.0` 与回退示例）

Teaching Use:
- 解决“用刷新率算 FPS cap 时在某些设备异常”的跨平台问题。
