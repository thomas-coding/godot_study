# K021 - FPS cap and V-Sync precedence

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- 启用 V-Sync（Enabled/Adaptive）时，`max_fps`/`application/run/max_fps` 受刷新率上限约束；有效上限应结合 `DisplayServer.screen_get_refresh_rate()` 判断。

Evidence:
- `godot/doc/classes/Engine.xml` -> `max_fps` 说明（V-Sync precedence）
- `godot/doc/classes/ProjectSettings.xml` -> `application/run/max_fps`, `display/window/vsync/vsync_mode`
- `godot/doc/classes/DisplayServer.xml` -> `screen_get_refresh_rate`

Teaching Use:
- 排查“设置 FPS 上限不生效/达不到预期”的配置联动问题。
