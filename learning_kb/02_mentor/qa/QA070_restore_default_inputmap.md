# QA070 - How can we restore default keybinds quickly?

Question:
- 课堂里要做“恢复默认按键”，最直接的做法是什么？

Version Scope: 4.6
Last Verified: 2026-02-25
Compatibility: unchanged

Answer (teaching-ready):
- 直接调用 `InputMap.load_from_project_settings()`。
- 该方法会先清空当前映射，再从 `ProjectSettings` 重新加载动作与事件。

Evidence:
- `godot/doc/classes/InputMap.xml` -> `load_from_project_settings`
- `godot/core/input/input_map.cpp` -> `InputMap::load_from_project_settings`
