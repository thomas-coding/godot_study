# K060 - reload_current_scene routes through current scene file path

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-22
Compatibility: unchanged

Conclusion:
- `reload_current_scene` 通过 `current_scene.get_scene_file_path()` 再调用 `change_scene_to_file`，语义是“重开当前关卡”。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `reload_current_scene`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::reload_current_scene`

Teaching Use:
- 用于规范多关卡项目的 `R` 行为：永远重开当前关卡，不硬编码回 Level 1。
