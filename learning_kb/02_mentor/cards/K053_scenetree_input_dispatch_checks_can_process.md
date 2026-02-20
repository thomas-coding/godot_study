# K053 - SceneTree input dispatch checks can_process gate per node

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-19
Compatibility: unchanged

Conclusion:
- `SceneTree::_call_input_pause` 分发输入时会先检查 `n->can_process()`，暂停态下不满足 gate 的节点不会收到输入回调。

Evidence:
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::_call_input_pause`
- `godot/scene/main/node.cpp` -> `Node::can_process`

Teaching Use:
- 用于解释“同样写了 `_unhandled_input`，为什么有的节点触发、有的不触发”。
