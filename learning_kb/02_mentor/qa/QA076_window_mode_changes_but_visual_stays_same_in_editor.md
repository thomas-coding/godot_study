# QA076 - Why does window mode log change but visuals stay the same in editor?

Question:
- 运行时日志显示窗口模式已切换，但画面看起来完全没变化，这是为什么？

Version Scope: 4.6
Last Verified: 2026-02-27
Compatibility: unchanged

Answer (teaching-ready):
- 先检查是否在编辑器“嵌入运行”模式：嵌入子窗口只支持 `windowed`，`fullscreen/borderless` 会被平台层拒绝。
- 处理顺序：
  1. 关闭嵌入运行（改为浮动/独立窗口）
  2. 重启运行后再切窗口模式
  3. 用视觉变化 + `window_get_mode()` 双重验收

Evidence:
- `godot/editor/run/game_view_plugin.cpp` -> `_play_pressed`, `set_embed_on_play`
- `godot/platform/windows/display_server_windows.cpp` -> `DisplayServerWindows::window_set_mode`
- `godot/platform/linuxbsd/x11/display_server_x11.cpp` -> `DisplayServerX11::window_set_mode`
