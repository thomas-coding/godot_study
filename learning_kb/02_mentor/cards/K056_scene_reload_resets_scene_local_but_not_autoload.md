# K056 - Scene reload resets scene-local state but not autoload singletons

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-19
Compatibility: unchanged

Conclusion:
- `reload_current_scene` 会重建当前场景实例（场景内变量重置），但不会自动重置 autoload 单例状态。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `root`, `current_scene`, `reload_current_scene`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::reload_current_scene`, `SceneTree::change_scene_to_node`

Teaching Use:
- 用于解释“重开后为什么本地分数清零，但全局管理器里的值还在”。
