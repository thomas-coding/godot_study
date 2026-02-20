# QA055 - Which input callback should handle gameplay hotkeys?

Question:
- `pause/restart` 这类玩法热键应该放 `_input` 还是 `_unhandled_input`？

Version Scope: 4.6
Last Verified: 2026-02-19
Compatibility: unchanged

Answer (teaching-ready):
- 默认推荐 `_unhandled_input`：先让 GUI 有机会处理，再处理玩法热键，冲突更少。
- `_input` 适合做更底层、全局、即时输入处理；但更容易和 UI 事件抢占。
- 键盘快捷键集中场景可考虑 `_shortcut_input`，并结合 `set_input_as_handled` 控制传播。

Evidence:
- `godot/doc/classes/Node.xml` -> `_input`, `_shortcut_input`, `_unhandled_input`
- `godot/doc/classes/Viewport.xml` -> `push_input` 传播顺序
- `godot/scene/main/viewport.cpp` -> `Viewport::push_input`
