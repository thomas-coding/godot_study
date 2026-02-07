# QA038 - SceneTree timer update order confusion

Question:
- `create_timer()` 的 timeout 为什么看起来总在节点逻辑之后触发？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 这是设计语义：timer 在节点处理后更新。
- `process_in_physics=true` 时，它在 physics 帧末更新；否则在 process 帧末更新。
- 如果你需要前置逻辑，改为手动状态机或在上一帧提前安排。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `create_timer` note
- `godot/scene/main/scene_tree.cpp` -> `physics_process/process` 中 `_process` 后 `process_timers`
