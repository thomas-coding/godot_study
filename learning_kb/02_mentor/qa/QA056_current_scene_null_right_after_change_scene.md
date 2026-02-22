# QA056 - Why is current_scene null right after change_scene?

Question:
- 为什么调用 `change_scene_to_file()` 后立刻访问 `get_tree().current_scene`，有时会是 `null`？

Version Scope: 4.6
Last Verified: 2026-02-22
Compatibility: unchanged

Answer (teaching-ready):
- 这是正常行为：场景切换是两阶段提交。
- 第一步旧场景会立即从树上移除；第二步在帧末再把新场景加入树。
- 所以中间会出现短暂 `current_scene == null` 的窗口。
- 需要稳定访问新场景时，用 `await get_tree().scene_changed`。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `change_scene_to_node`, `scene_changed`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::change_scene_to_node`, `_flush_scene_change`
