# QA069 - Why are runtime key rebinds lost after restart?

Question:
- 我运行时改了按键映射，重启后为什么恢复默认了？

Version Scope: 4.6
Last Verified: 2026-02-25
Compatibility: unchanged

Answer (teaching-ready):
- `InputMap.action_add_event/action_erase_events` 修改的是当前进程里的输入映射。
- 如果不把映射写入自己的存档（如 `ConfigFile`）并在启动时重放，重启后会回到项目默认输入。

Evidence:
- `godot/doc/classes/InputMap.xml` -> `action_add_event`, `action_erase_events`, `load_from_project_settings`
- `godot/core/input/input_map.cpp` -> `InputMap::action_add_event`, `InputMap::action_erase_events`, `InputMap::load_from_project_settings`
