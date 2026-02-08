# QA045 - Runtime toggle of input processing callbacks

Question:
- 运行时开关 `set_process_input()` / `set_process_unhandled_input()`，为什么行为是立刻变化的？

Version Scope: 4.6
Last Verified: 2026-02-08
Compatibility: unchanged

Answer (teaching-ready):
- 这不是“仅改布尔值”，底层会把节点加入/移出 Viewport 输入分发组（`_vp_input*`, `_vp_unhandled_input*`）。
- 所以在树内切换后会立即影响是否收到对应回调。
- 如果节点不在树内，组注册不会发生，通常要等进树后才生效。

Evidence:
- `godot/scene/main/node.cpp` -> `Node::set_process_input`, `Node::set_process_unhandled_input`, `Node::set_process_unhandled_key_input`
