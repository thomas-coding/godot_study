# K055 - reload_current_scene reloads by current scene file path on main thread

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-19
Compatibility: unchanged

Conclusion:
- `reload_current_scene` 仅允许主线程调用，内部读取 `current_scene->get_scene_file_path()` 并走 `change_scene_to_file` 重载流程。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `reload_current_scene`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::reload_current_scene`, `SceneTree::change_scene_to_file`

Teaching Use:
- 用于解释“重开为什么恢复到场景初始布局”。
