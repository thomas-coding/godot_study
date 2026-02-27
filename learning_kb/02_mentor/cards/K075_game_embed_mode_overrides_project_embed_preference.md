# K075 - game_embed_mode can override project embed preference

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-27
Compatibility: unchanged

Conclusion:
- 编辑器全局设置 `run/window_placement/game_embed_mode` 可覆盖项目内嵌入运行偏好，导致“项目设置改了但运行方式不变”。

Evidence:
- `godot/doc/classes/EditorSettings.xml` -> `run/window_placement/game_embed_mode`
- `godot/editor/run/game_view_plugin.cpp` -> `_play_pressed`, `set_embed_on_play`

Teaching Use:
- 用于课堂第一步环境排查，避免把运行模式问题误判为业务逻辑问题。
