# QA044 - Pause mode and SceneTree timer behavior

Question:
- 游戏暂停后，为什么有些节点和 timer 还在跑？

Version Scope: 4.6
Last Verified: 2026-02-08
Compatibility: unchanged

Answer (teaching-ready):
- 节点是否继续跑由 `Node.process_mode` 决定，`ALWAYS` 与 `WHEN_PAUSED` 在暂停时都可能继续执行。
- `create_timer()` 默认 `process_always=true`，所以暂停时可能仍更新；你要暂停它，需显式传 `process_always=false`。
- `process_in_physics=true` 只改变更新时间点（physics 帧末），不改变 paused 规则。

Evidence:
- `godot/doc/classes/Node.xml` -> `can_process`, `process_mode`
- `godot/doc/classes/SceneTree.xml` -> `create_timer`, `paused`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::process_timers`, `SceneTree::set_pause`
