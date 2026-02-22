# QA057 - What is the best hook for post-transition initialization?

Question:
- 关卡切换后应该在哪个时机做初始化最稳？

Version Scope: 4.6
Last Verified: 2026-02-22
Compatibility: unchanged

Answer (teaching-ready):
- 关卡内本地初始化优先放新场景自己的 `_ready()`。
- 跨场景编排（如 AutoLoad 想拿到新场景根节点）优先 `await get_tree().scene_changed`。
- 不建议在 `change_scene_to_file()` 同一行后立刻访问新场景节点，因为存在空窗期。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `scene_changed`, `change_scene_to_node`
- `godot/scene/main/scene_tree.cpp` -> `_flush_scene_change` emits `scene_changed`
