# M02 - SceneTree Process Pipeline

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-06
Compatibility: unchanged

## Core Conclusion

- `SceneTree::physics_process` 与 `SceneTree::process` 都不是“只调用节点回调”这么简单；它们还会处理消息队列、timer/tween、删除队列与场景切换等系统工作。

## Evidence

- Source: `godot/scene/main/scene_tree.cpp`
  - `SceneTree::physics_process(double)`
    - 调 `MainLoop::physics_process`
    - `_process(true)`
    - `process_timers(..., true)` / `process_tweens(..., true)`
    - `_flush_delete_queue()`
  - `SceneTree::process(double)`
    - 调 `MainLoop::process`
    - `_process(false)`
    - 可能执行 `_flush_scene_change()`
    - `process_timers(..., false)` / `process_tweens(..., false)`
    - `_flush_delete_queue()`

## Teaching Use

- 回答“为什么 `queue_free()` 没立即生效”时，指出删除队列在 loop 末尾 flush。
- 回答“timer/tween 何时更新”时，区分 physics frame 与 idle frame。

## Fast Answer Snippet

- SceneTree 每帧会在节点回调之外处理消息、计时器、补间和删除队列，所以很多效果是“本帧末尾统一生效”。
