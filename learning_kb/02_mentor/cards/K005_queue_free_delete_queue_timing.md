# K005 - queue_free and delete queue timing

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- `queue_free()` 不是立即销毁；对象先进入 `delete_queue`，在 `SceneTree` 帧尾 `_flush_delete_queue()` 统一 `memdelete`。

Evidence:
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::queue_delete`, `SceneTree::_flush_delete_queue`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::physics_process`, `SceneTree::process`（帧尾调用 `_flush_delete_queue`）

Teaching Use:
- 用于解释“我刚 queue_free 但这帧还能访问到节点”的常见疑问，并指导在帧尾语义下写安全逻辑。
