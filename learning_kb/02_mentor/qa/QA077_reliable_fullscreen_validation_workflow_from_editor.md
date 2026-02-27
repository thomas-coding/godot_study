# QA077 - What is the reliable fullscreen validation workflow from editor?

Question:
- 在编辑器里怎么验证 fullscreen/borderless 才不会被运行环境误导？

Version Scope: 4.6
Last Verified: 2026-02-27
Compatibility: unchanged

Answer (teaching-ready):
- 推荐固定流程：
  1. 先确认 `game_embed_mode`，确保不是嵌入运行
  2. 在独立窗口里执行 `window_set_mode`
  3. 读取 `window_get_mode` 与视觉变化交叉验证
  4. 全屏切回窗口后按需恢复 `borderless`

Evidence:
- `godot/doc/classes/EditorSettings.xml` -> `run/window_placement/game_embed_mode`
- `godot/doc/classes/DisplayServer.xml` -> `window_set_mode`, `window_get_mode`, `window_set_flag`
