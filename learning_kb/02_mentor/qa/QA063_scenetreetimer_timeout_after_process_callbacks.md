# QA063 - Why does timeout happen after _process in the same frame?

Question:
- 为什么我感觉 `SceneTreeTimer.timeout` 总在本帧 `_process` 后才触发？

Version Scope: 4.6
Last Verified: 2026-02-22
Compatibility: unchanged

Answer (teaching-ready):
- 这是引擎设计：`SceneTreeTimer` 在节点回调之后处理。
- 普通模式下先跑节点 `_process`，然后 timer 更新；`process_in_physics=true` 时对应 `_physics_process` 之后。
- 所以“同帧先节点后 timer”是预期顺序，不是延迟 bug。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `create_timer` note (timer updated after nodes)
- `godot/doc/classes/SceneTreeTimer.xml` -> note
- `godot/scene/main/scene_tree.cpp` -> `process` / `physics_process` then `process_timers`
