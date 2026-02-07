# QA031 - GROUP_CALL_UNIQUE without deferred

Question:
- 为什么我加了 `GROUP_CALL_UNIQUE`，同一帧还是重复执行组调用？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 因为 `GROUP_CALL_UNIQUE` 只有和 `GROUP_CALL_DEFERRED` 一起用才生效。
- 正确写法是：`GROUP_CALL_DEFERRED | GROUP_CALL_UNIQUE`。
- 如果只写 UNIQUE，会走普通调用路径，不会进入同帧去重表。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `GROUP_CALL_UNIQUE`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::call_group_flagsp`
