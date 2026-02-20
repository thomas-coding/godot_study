# QA053 - Restart called while paused stays inconsistent

Question:
- 为什么暂停状态下重开后有时状态不一致（例如提示还在暂停态）？

Version Scope: 4.6
Last Verified: 2026-02-19
Compatibility: unchanged

Answer (teaching-ready):
- `paused` 是 `SceneTree` 级状态，不是场景内局部变量。
- 建议在重开前先显式 `get_tree().paused = false`，再 `reload_current_scene()`。
- 这样可避免把暂停态带入下一次场景初始化逻辑。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `paused`, `reload_current_scene`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::set_pause`, `SceneTree::reload_current_scene`
