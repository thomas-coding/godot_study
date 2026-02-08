# QA043 - _gui_input not firing due to mouse_filter/propagation

Question:
- 为什么我明明点到了控件，但 `_gui_input` 不触发？

Version Scope: 4.6
Last Verified: 2026-02-08
Compatibility: unchanged

Answer (teaching-ready):
- 先检查 `mouse_filter`：`IGNORE` 不会收事件，`STOP` 会阻断向上链路。
- 再检查是否被上层控件遮挡或父节点先把事件处理掉。
- 还要看是否有代码调用了 `accept_event()`，这会把事件标记为 handled。

Evidence:
- `godot/doc/classes/Control.xml` -> `_gui_input` not-called 条件, `MOUSE_FILTER_*`
- `godot/scene/main/viewport.cpp` -> `Viewport::_gui_call_input`
- `godot/scene/gui/control.cpp` -> `Control::accept_event`
