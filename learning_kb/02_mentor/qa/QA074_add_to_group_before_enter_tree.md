# QA074 - Why is add_to_group not reflected before add_child?

Question:
- 我先 `add_to_group("enemies")`，再 `add_child()`，为什么 `SceneTree` 查询不到它？

Version Scope: 4.6
Last Verified: 2026-02-27
Compatibility: unchanged

Answer (teaching-ready):
- `add_to_group` 在未入树时只记录在节点本地，真正注册到 `SceneTree` 的组系统要等节点进入树后。
- 所以在 `add_child` 前用 `SceneTree.get_nodes_in_group` 或 `get_node_count_in_group` 查不到该节点是预期行为。

Evidence:
- `godot/doc/classes/Node.xml` -> `add_to_group` note
- `godot/scene/main/node.cpp` -> `Node::add_to_group`
