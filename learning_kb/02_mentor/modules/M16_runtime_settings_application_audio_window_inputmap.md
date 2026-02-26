# M16 - Runtime settings application (audio/window/inputmap)

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-25
Compatibility: unchanged

## Core Conclusion

- 音量设置推荐走 `AudioServer` 总线：先 `get_bus_index("Master")`，再 `set_bus_volume_linear` 或 `set_bus_volume_db`。
- `set_bus_volume_linear` 底层会转成 dB（等价 `linear_to_db`），滑条用 0..1 线性值最直观。
- 窗口模式推荐走 `DisplayServer.window_set_mode`（或 `Window.mode`），并区分 `WINDOWED/FULLSCREEN/EXCLUSIVE_FULLSCREEN`。
- fullscreen 会强制 borderless，退出全屏后若需要边框需显式恢复（文档已注明）。
- 运行时改键位可用 `InputMap.action_erase_events + action_add_event`，但只影响当前运行期；重启后若不自行持久化并重放，会回到项目默认映射。
- `InputMap.load_from_project_settings()` 会先 `clear` 再重建，等价“恢复默认键位”入口。

## Evidence

- Docs:
  - `godot/doc/classes/AudioServer.xml`
    - `get_bus_index`, `set_bus_volume_db`, `set_bus_volume_linear`
  - `godot/doc/classes/@GlobalScope.xml`
    - `linear_to_db`
  - `godot/doc/classes/DisplayServer.xml`
    - `window_set_mode`, `window_get_mode`, `WINDOW_MODE_*`
  - `godot/doc/classes/Window.xml`
    - member `mode`, constants `MODE_*`
  - `godot/doc/classes/InputMap.xml`
    - `action_add_event`, `action_erase_events`, `event_is_action`, `load_from_project_settings`
- Source:
  - `godot/servers/audio/audio_server.cpp`
    - `AudioServer::get_bus_index`
    - `AudioServer::set_bus_volume_db`
    - `AudioServer::set_bus_volume_linear`
  - `godot/servers/display/display_server.h`
    - `DisplayServer::WindowMode`
    - `window_set_mode/window_get_mode` virtual interface
  - `godot/servers/display/display_server.cpp`
    - `ClassDB::bind_method` for `window_set_mode/window_get_mode`
  - `godot/platform/windows/display_server_windows.cpp`
    - `DisplayServerWindows::window_set_mode`
    - `DisplayServerWindows::window_get_mode`
  - `godot/core/input/input_map.cpp`
    - `InputMap::action_add_event`
    - `InputMap::action_erase_events`
    - `InputMap::load_from_project_settings`

## Teaching Use

- 第14课课堂口径：
  1. “设置项分三类”：音频、窗口、键位。
  2. “应用接口分三层”：`AudioServer`、`DisplayServer/Window`、`InputMap`。
  3. “持久化不是自动”：设置改动必须写 `ConfigFile`，下次启动手动回放。
- 最小排错顺序：
  1. 音频：确认 `bus_idx != -1`。
  2. 窗口：确认当前平台支持目标模式。
  3. 键位：确认 action 存在、清空后已重新添加事件。

## Fast Answer Snippet

- 第14课设置系统可用“运行时应用 + 启动时回放”模式：`AudioServer` 调音量、`DisplayServer/Window` 切窗口模式、`InputMap` 改按键；所有修改先落 `ConfigFile`，重启后按保存值重放即可稳定生效。
