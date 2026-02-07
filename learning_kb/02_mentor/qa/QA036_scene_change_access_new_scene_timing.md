# QA036 - Accessing new scene right after change_scene

Question:
- 为什么调用 `change_scene_to_node()` 后立刻访问新场景节点会拿到空？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 因为切场景是两阶段：旧场景先移除，新场景在后续 `process` 帧提交。
- 调用后短窗口里 `current_scene` 可能是空，等 `scene_changed` 信号后再访问最稳。
- 这和 `queue_free` 的安全延后语义类似，都是为了避免同帧并行运行两个场景。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `change_scene_to_node`, `scene_changed`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::change_scene_to_node`, `SceneTree::process`, `_flush_scene_change`
