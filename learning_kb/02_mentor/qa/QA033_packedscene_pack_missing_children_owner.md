# QA033 - PackedScene.pack missing children due to owner

Question:
- `PackedScene.pack()` 后为什么有些子节点没被保存？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 首先检查这些子节点的 `Node.owner`。
- `pack(root)` 只保存 `root` 本体和 owned 子树；无 owner 或 owner 不在预期链上的节点会被排除。
- 先修正 owner，再重新打包，通常就能恢复完整保存。

Evidence:
- `godot/doc/classes/PackedScene.xml` -> `pack` + owner 示例
- `godot/scene/resources/packed_scene.cpp` -> `SceneState::_parse_node`
