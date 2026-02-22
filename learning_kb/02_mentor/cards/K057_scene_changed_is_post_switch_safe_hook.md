# K057 - scene_changed is the post-switch safe hook for current_scene

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-22
Compatibility: unchanged

Conclusion:
- 场景切换后若要稳定访问新 `current_scene`，应等待 `scene_changed`，因为该信号在新场景加入并初始化后才发出。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `scene_changed`
- `godot/scene/main/scene_tree.cpp` -> `_flush_scene_change`, `emit_signal("scene_changed")`

Teaching Use:
- 用于解释“为什么 `change_scene_to_file` 后立刻取节点会偶发空引用”。
