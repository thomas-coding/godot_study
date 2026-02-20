# K052 - Viewport input dispatch has fixed stage order and handled short-circuit

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-19
Compatibility: unchanged

Conclusion:
- `push_input` 的传播顺序固定为 `_input -> _gui_input -> _shortcut_input -> _unhandled_key_input -> _unhandled_input`；任一阶段 `set_input_as_handled` 后，后续阶段不再调用。

Evidence:
- `godot/doc/classes/Viewport.xml` -> `push_input`, `set_input_as_handled`
- `godot/scene/main/viewport.cpp` -> `Viewport::push_input`, `Viewport::_push_unhandled_input_internal`

Teaching Use:
- 用于解释“为什么 Main 的 `_unhandled_input` 有时收不到按键”。
