# K038 - Scene change file/reload has main-thread guard

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- `change_scene_to_file()` 与 `reload_current_scene()` 只能在主线程调用，否则返回错误。

Evidence:
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::change_scene_to_file`, `SceneTree::reload_current_scene`

Teaching Use:
- 用于规范异步加载后回主线程再切场景，避免线程上下文错误。
