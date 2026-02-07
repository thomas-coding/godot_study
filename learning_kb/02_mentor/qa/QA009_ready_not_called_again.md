# QA009 - _ready not called after re-adding node

Question:
- 为什么我把节点 remove 后再 add 回树里，`_ready()` 没再执行？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 这是默认行为：`_ready` 对同一节点实例只会自动触发一次。
- 若你想复用实例并重新执行初始化，需在重新加入场景树前调用 `request_ready()`。
- 可配合 `is_node_ready()` 判断当前实例是否处于 ready 状态。

Evidence:
- `godot/doc/classes/Node.xml` -> `_ready` / `request_ready` / `is_node_ready`
- `godot/scene/main/node.cpp` -> `Node::request_ready`, `_propagate_ready`
