# QA037 - Scene change in worker thread fails

Question:
- 为什么在线程任务里调用 `change_scene_to_file()` 会失败？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- `change_scene_to_file()` 有主线程限制，只能在主线程调用。
- 推荐做法：后台线程只做 IO/计算，切场景动作回主线程执行。
- `reload_current_scene()` 也有相同约束。

Evidence:
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::change_scene_to_file`, `SceneTree::reload_current_scene`
