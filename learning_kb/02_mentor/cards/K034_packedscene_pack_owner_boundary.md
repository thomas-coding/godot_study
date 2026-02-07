# K034 - PackedScene.pack persists by owner boundary

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- `PackedScene.pack(root)` 只会保存 `root` 及其 owned 子节点；未正确设置 `Node.owner` 的节点不会被打包。

Evidence:
- `godot/doc/classes/PackedScene.xml` -> `pack` 与 `Node.owner` 示例
- `godot/scene/resources/packed_scene.cpp` -> `SceneState::_parse_node` / `SceneState::pack`（owner 过滤）

Teaching Use:
- 用于排查“编辑器看得到子节点，但保存后场景丢节点”的持久化边界问题。
