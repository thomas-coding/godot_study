# QA004 - why queue_free is not immediate

Question:
- 为什么我调用 `queue_free()` 后，这一帧里节点有时还“存在”？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- `queue_free()` 的语义是“排队删除”，不是立即 `memdelete`。
- 引擎会把对象 ID 放进 `SceneTree` 的删除队列，通常在当前 physics/process 帧尾调用 `_flush_delete_queue()` 时统一销毁。
- 因此这帧后续逻辑里仍可能拿到旧引用，写逻辑时要避免在同一帧继续依赖待删对象。

Evidence:
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::queue_delete`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::_flush_delete_queue`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::physics_process` / `SceneTree::process`（帧尾 flush）
