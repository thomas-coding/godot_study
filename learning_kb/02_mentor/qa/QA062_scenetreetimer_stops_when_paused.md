# QA062 - Why does SceneTreeTimer stop when the game is paused?

Question:
- 我的 `create_timer(1.0)` 在暂停后不触发了，为什么？

Version Scope: 4.6
Last Verified: 2026-02-22
Compatibility: unchanged

Answer (teaching-ready):
- 默认 `create_timer` 的 `process_always=true`，但若你显式传了 `false`，计时器会在 `SceneTree.paused=true` 时停住。
- 课堂里常见场景：玩法逻辑要停，但 UI 倒计时想继续，这时应使用 `process_always=true`。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `create_timer(process_always)`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::process_timers` pause gate
