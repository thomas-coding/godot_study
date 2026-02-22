# K064 - SceneTreeTimer ignore_time_scale uses unscaled process step

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-22
Compatibility: unchanged

Conclusion:
- `ignore_time_scale=true` 时，`SceneTreeTimer` 使用未缩放步长推进；否则跟随 `delta`，会受 `Engine.time_scale` 影响。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `create_timer(ignore_time_scale)`
- `godot/doc/classes/Engine.xml` -> `time_scale`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::process_timers` (`unscaled_delta` 分支)

Teaching Use:
- 用于解释子弹时间下“技能 CD 该不该随时间缩放”的实现选择。
