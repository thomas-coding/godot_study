# K010 - Node _ready lifecycle and request_ready

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- 节点默认只会触发一次 `_ready`；从树中移除再加入不会自动再次触发，需在重新加入前调用 `request_ready()`。

Evidence:
- `godot/doc/classes/Node.xml` -> `_ready` 说明（默认只触发一次）
- `godot/doc/classes/Node.xml` -> `request_ready` / `is_node_ready`
- `godot/scene/main/node.cpp` -> `Node::request_ready`, `Node::_propagate_ready`, `NOTIFICATION_READY`

Teaching Use:
- 回答“复用节点后初始化没重跑”的问题，并给出正确复位方式。
