# K037 - Scene change uses two-phase commit timing

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- `change_scene_to_node()` 不是同步完成切换：旧场景先被移除，新场景在后续 `process` 阶段提交并触发 `scene_changed`。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `change_scene_to_node` 操作顺序说明
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::change_scene_to_node`, `SceneTree::process`, `SceneTree::_flush_scene_change`

Teaching Use:
- 用于解释“切场景后立刻访问新节点为空”的时序坑。
