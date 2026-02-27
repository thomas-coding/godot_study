# M18 - Embedded run window modes and modal settings UI layout

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-27
Compatibility: unchanged

## Core Conclusion

- 编辑器运行形态受 `run/window_placement/game_embed_mode` 全局设置影响，可能覆盖项目侧“嵌入运行”偏好。
- 当游戏窗口以嵌入子窗口运行时，非 `windowed` 模式会被底层直接拒绝（Windows/X11 都有 guard）。
- 因此“窗口模式日志变化但视觉不变”常见于编辑器嵌入运行，不是业务脚本未生效。
- 验证窗口模式行为时，优先切到浮动窗口/独立窗口运行，再观察 fullscreen/borderless 的实际效果。
- 模态设置面板建议采用 `Control` 全屏遮罩 + 居中 `Panel` + `VBoxContainer` 布局，结合 `PRESET_FULL_RECT`、`size_flags_*`、`mouse_filter` 实现可点可挡的稳定交互。

## Evidence

- Class docs:
  - `godot/doc/classes/EditorSettings.xml`
    - `run/window_placement/game_embed_mode`
  - `godot/doc/classes/DisplayServer.xml`
    - `window_set_mode`
    - `window_get_mode`
    - `WindowMode`
  - `godot/doc/classes/Control.xml`
    - `PRESET_FULL_RECT`
    - `size_flags_horizontal`
    - `size_flags_vertical`
    - `mouse_filter`
- Source:
  - `godot/editor/run/game_view_plugin.cpp`
    - `_play_pressed`
    - `set_embed_on_play`
    - `set_make_floating_on_play`
  - `godot/platform/windows/display_server_windows.cpp`
    - `DisplayServerWindows::window_set_mode`
  - `godot/platform/linuxbsd/x11/display_server_x11.cpp`
    - `DisplayServerX11::window_set_mode`

## Teaching Use

- 第14课复盘口径：
  1. 先确认运行环境（嵌入/浮动）再测窗口模式。
  2. 视觉验收与日志验收分离，避免“日志已变=功能通过”的误判。
  3. 设置面板优先走模态布局模板，降低点击遮挡和布局漂移。

- Lesson20 备课口径：
  - Boss 战调试窗口建议使用独立窗口运行，避免嵌入模式干扰窗口相关验证。

## Fast Answer Snippet

- 看到 `Embedded window only supports Windowed mode.` 时，优先判断为“编辑器嵌入运行限制”，先切浮动/独立窗口再验证 `window_set_mode` 视觉效果。
