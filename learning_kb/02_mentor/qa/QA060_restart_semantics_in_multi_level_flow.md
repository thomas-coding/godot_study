# QA060 - Why use reload_current_scene for restart in multi-level flow?

Question:
- 多关卡项目里，为什么 `R` 重开推荐 `reload_current_scene()`，而不是硬编码切回 `level_01.tscn`？

Version Scope: 4.6
Last Verified: 2026-02-22
Compatibility: unchanged

Answer (teaching-ready):
- `reload_current_scene()` 的语义是“重开当前关卡”，不会破坏你所在关卡上下文。
- 它内部读取 `current_scene.get_scene_file_path()` 后再执行 `change_scene_to_file()`。
- 若硬编码回 `level_01.tscn`，在 Level 2 按重开会错误跳关，导致课堂验收语义混乱。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `reload_current_scene`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::reload_current_scene`
