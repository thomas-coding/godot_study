# QA051 - Pause label shows but player still moves

Question:
- 为什么按了暂停键后 `PauseLabel` 显示了，但 `Player` 还在移动？

Version Scope: 4.6
Last Verified: 2026-02-19
Compatibility: unchanged

Answer (teaching-ready):
- 常见根因是 `Player` 仍在 `PROCESS_MODE_ALWAYS`（或继承自父节点 `ALWAYS`）。
- `SceneTree.paused=true` 只会暂停 `PAUSABLE` 节点，不会暂停 `ALWAYS` 节点。
- 修复：`Main` 保持 `ALWAYS`（收热键），玩法节点（`Player/Coin`）显式设为 `PAUSABLE`。

Evidence:
- `godot/doc/classes/Node.xml` -> `process_mode`, `can_process`, `PROCESS_MODE_*`
- `godot/scene/main/node.cpp` -> `Node::_can_process`
- `godot/doc/classes/SceneTree.xml` -> `paused`
