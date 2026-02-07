# QA020 - fps cap not working under V-Sync

Question:
- 我设置了 `max_fps`，但帧率看起来不按这个值走，为什么？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 先看 V-Sync：当 `display/window/vsync/vsync_mode` 为 Enabled/Adaptive 时，V-Sync 规则优先于 FPS cap。
- 实际可达上限还受显示器刷新率约束，可用 `DisplayServer.screen_get_refresh_rate()` 做环境确认。
- 因此调帧率策略要“FPS cap + V-Sync + 刷新率”三者联动看，不要单看一个参数。

Evidence:
- `godot/doc/classes/Engine.xml` -> `max_fps`
- `godot/doc/classes/ProjectSettings.xml` -> `application/run/max_fps`, `display/window/vsync/vsync_mode`
- `godot/doc/classes/DisplayServer.xml` -> `screen_get_refresh_rate`
