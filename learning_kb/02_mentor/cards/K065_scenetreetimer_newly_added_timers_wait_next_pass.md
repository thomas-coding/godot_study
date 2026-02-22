# K065 - Newly added SceneTreeTimers wait until next timer pass

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-22
Compatibility: unchanged

Conclusion:
- `process_timers()` 遍历时以进入函数时的末尾元素作为边界；遍历中新增的 timer 不会在同一轮被处理，会等下一轮。

Evidence:
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::process_timers` (`L = timers.back()` + break condition)

Teaching Use:
- 用于解释“在 timeout 回调里再建 timer 不是同帧触发”的现象。
