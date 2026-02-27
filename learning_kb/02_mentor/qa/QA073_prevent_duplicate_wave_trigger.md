# QA073 - How to prevent the same trigger from spawning duplicate waves?

Question:
- 一个触发区被多次进入时，怎么避免同一波次重复刷怪？

Version Scope: 4.6
Last Verified: 2026-02-27
Compatibility: unchanged

Answer (teaching-ready):
- 最稳做法是双保险：
  1. 业务层布尔或集合去重（`wave_started` / `triggered_event_ids`）
  2. 若用组广播，使用 `GROUP_CALL_DEFERRED | GROUP_CALL_UNIQUE`
- 注意：`GROUP_CALL_UNIQUE` 单独使用不会去重。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `call_group_flags`, `GROUP_CALL_UNIQUE`, `GROUP_CALL_DEFERRED`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::call_group_flagsp`
