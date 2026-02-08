# K044 - Control GUI input flow and accept_event behavior

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-08
Compatibility: unchanged

Conclusion:
- `Control::_call_gui_input` 先发 `gui_input` 信号，再调 `_gui_input` 与 `gui_input()`；`accept_event()` 会在 Viewport 层标记 handled 并阻断后续链路。

Evidence:
- `godot/doc/classes/Control.xml` -> `_gui_input`, `accept_event`
- `godot/scene/gui/control.cpp` -> `Control::_call_gui_input`, `Control::accept_event`
- `godot/scene/main/viewport.cpp` -> `Viewport::_gui_accept_event`, `Viewport::set_input_as_handled`

Teaching Use:
- 用于排查“UI 吞输入后 gameplay 收不到事件”。
