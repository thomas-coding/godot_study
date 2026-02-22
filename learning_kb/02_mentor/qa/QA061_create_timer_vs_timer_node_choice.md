# QA061 - Should we use SceneTree.create_timer or a Timer node?

Question:
- 延时逻辑该用 `get_tree().create_timer()` 还是场景里的 `Timer` 节点？

Version Scope: 4.6
Last Verified: 2026-02-22
Compatibility: unchanged

Answer (teaching-ready):
- 一次性、短生命周期延时：优先 `create_timer()`，代码短、无需额外节点。
- 需要可视化配置、可重复触发、编辑器里可调参数：优先 `Timer` 节点。
- 若要延时跨越场景树暂停或 `time_scale` 变化，`create_timer()` 直接用参数就能表达（`process_always` / `ignore_time_scale`）。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `create_timer`
- `godot/doc/classes/SceneTreeTimer.xml`
- `godot/doc/classes/Timer.xml`
