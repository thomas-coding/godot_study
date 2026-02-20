# QA052 - Same hotkey triggers twice in _unhandled_input

Question:
- 为什么按一次 `R`，看起来执行了两次重开/两次计数操作？

Version Scope: 4.6
Last Verified: 2026-02-19
Compatibility: unchanged

Answer (teaching-ready):
- 通常是多个节点都在处理同一 `_unhandled_input` 事件。
- 事件传播中如果没人标记 handled，后续节点也会继续收到。
- 修复方案：
  1. 把全局热键集中到 `Main`；
  2. 必要时在处理后调用 `get_viewport().set_input_as_handled()` 阻断后续传播。

Evidence:
- `godot/doc/classes/Viewport.xml` -> `push_input`, `set_input_as_handled`
- `godot/doc/classes/Node.xml` -> `_unhandled_input`
- `godot/scene/main/viewport.cpp` -> `Viewport::push_input`
