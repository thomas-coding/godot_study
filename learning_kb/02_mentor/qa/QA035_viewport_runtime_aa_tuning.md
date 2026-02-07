# QA035 - Viewport runtime AA tuning

Question:
- 运行时切换抗锯齿和像素对齐，推荐走 `ProjectSettings` 还是 `Viewport`？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 运行时推荐走 `Viewport` setter（例如 `set_msaa_2d`, `set_screen_space_aa`, `set_use_taa`）。
- 这些调用会下发到 `RenderingServer.viewport_set_*`，即时生效。
- `ProjectSettings` 更适合启动前默认值，不是运行时调参主入口。

Evidence:
- `godot/doc/classes/Viewport.xml` -> AA/pixel-snap 成员说明
- `godot/scene/main/viewport.cpp` -> setter -> `RS::viewport_set_*`
- `godot/servers/rendering/rendering_server.h` -> `viewport_set_*`
