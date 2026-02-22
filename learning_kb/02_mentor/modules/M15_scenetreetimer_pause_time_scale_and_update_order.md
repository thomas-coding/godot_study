# M15 - SceneTreeTimer pause/time-scale semantics and update order

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-22
Compatibility: unchanged

## Core Conclusion

- `SceneTree.create_timer()` 返回一次性 `SceneTreeTimer`，到时发出 `timeout` 后自动释放；若要跨更多帧持有，必须保留引用。
- 计时器处理发生在节点回调之后：普通模式在 `_process` 之后，`process_in_physics=true` 时在 `_physics_process` 之后。
- `process_always=false` 的计时器会被 `SceneTree.paused` 暂停；`process_always=true` 可在暂停态继续走。
- `ignore_time_scale=true` 时，计时减法走未缩放步长；否则跟随 `delta` 受 `Engine.time_scale` 影响。
- `process_timers()` 对“本轮新增计时器”采用延后策略：遍历时以开始时的末尾元素为边界，新加计时器到下一轮再处理。

## Evidence

- Class docs: `godot/doc/classes/SceneTree.xml`
  - `create_timer`（`process_always` / `process_in_physics` / `ignore_time_scale`）
  - timer 更新在所有节点之后
- Class docs: `godot/doc/classes/SceneTreeTimer.xml`
  - one-shot 语义、自动释放说明、保持引用说明
- Class docs: `godot/doc/classes/Engine.xml`
  - `time_scale` 影响 `SceneTreeTimer`
- Source: `godot/scene/main/scene_tree.cpp`
  - `SceneTree::create_timer`
  - `SceneTree::process_timers`
  - `SceneTreeTimer::get_time_left`
  - `SceneTree::finalize` + `SceneTreeTimer::release_connections`

## Teaching Use

- 用于第12课与第18课的课堂高频坑：
  1. 暂停后延时逻辑为何不触发。
  2. 子弹时间（`time_scale`）下 UI 倒计时为何“忽快忽慢”。
  3. 在 `timeout` 回调里再建 timer 为何不是“同帧连发”。
- 推荐课堂话术：先判“是否 paused 卡住”，再判“是否受 time_scale 影响”，最后判“是否是同帧新增 timer 期望错误”。

## Fast Answer Snippet

- `SceneTreeTimer` 是帧尾处理的一次性延时器；要跨暂停和子弹时间，优先看 `process_always` 与 `ignore_time_scale`；若在回调里新建 timer，默认下一轮才会开始参与处理。
