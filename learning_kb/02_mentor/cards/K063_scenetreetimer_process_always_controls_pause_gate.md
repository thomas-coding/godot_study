# K063 - SceneTreeTimer process_always controls pause gate behavior

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-22
Compatibility: unchanged

Conclusion:
- `create_timer(..., process_always=false)` 会在 `SceneTree.paused=true` 时停止推进；`process_always=true` 则可在暂停态继续计时。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `create_timer`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::process_timers` pause check

Teaching Use:
- 用于课堂里区分“玩法暂停也停”与“UI 倒计时不停”两种需求。
