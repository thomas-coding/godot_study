# K039 - SceneTree timer updates after node processing

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- `SceneTree.create_timer()` 产生的计时器在对应帧域中是“节点处理后更新”，不是节点处理前。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `create_timer` 的 update-order 说明
- `godot/scene/main/scene_tree.cpp` -> `_process` 后调用 `process_timers`

Teaching Use:
- 用于解释“同一帧里 await timer 没按预期先触发”的调试现象。
