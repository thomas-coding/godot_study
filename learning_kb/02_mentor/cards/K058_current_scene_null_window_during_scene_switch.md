# K058 - current_scene has a null window during scene switch

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-22
Compatibility: unchanged

Conclusion:
- `change_scene_to_node` 调用后，旧场景会立即移除，直到帧末新场景提交前，`current_scene` 可能短暂为 `null`。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `change_scene_to_node` order note
- `godot/scene/main/scene_tree.cpp` -> `change_scene_to_node`, `_flush_scene_change`

Teaching Use:
- 用于建立“切换两阶段”心智模型，避免在错误时机初始化 HUD/状态。
