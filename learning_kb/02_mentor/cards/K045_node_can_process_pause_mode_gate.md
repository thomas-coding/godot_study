# K045 - Node.can_process is gated by process_mode and SceneTree.paused

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-08
Compatibility: unchanged

Conclusion:
- `Node.can_process()` 在树内会结合 `SceneTree.paused` 与 `process_mode` 判断，`PAUSABLE/WHEN_PAUSED/ALWAYS/DISABLED` 分支语义明确。

Evidence:
- `godot/doc/classes/Node.xml` -> `can_process`, `process_mode`
- `godot/scene/main/node.cpp` -> `Node::can_process`, `Node::_can_process`

Teaching Use:
- 用于解决“暂停后某些节点还在跑/不该停却停了”的配置错误。
