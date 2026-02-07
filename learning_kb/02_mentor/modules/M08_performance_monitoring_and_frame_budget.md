# M08 - Performance Monitoring and Frame Budget

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

## Core Conclusion

- 性能排查先做“预算化”而不是盲调：用 `Performance` 监视器先判断是 process、physics、draw call 还是内存侧压力。
- `Performance` 部分监视器只在 debug 可用，release 导出会返回 0；对比测试要区分构建形态。
- 物理步长稳定性由 `Engine.physics_ticks_per_second` 与 `Engine.max_physics_steps_per_frame` 共同约束；设置不当会出现“看似慢动作”现象。

## Evidence

- Class docs: `godot/doc/classes/Performance.xml`
  - `get_monitor`
  - `TIME_FPS`, `TIME_PROCESS`, `TIME_PHYSICS_PROCESS`, `RENDER_TOTAL_DRAW_CALLS_IN_FRAME`
  - debug/release 可用性说明
- Source: `godot/main/performance.cpp`
  - `Performance::get_monitor`（各监视器映射到 Engine/RS/PhysicsServer 数据）
- Class docs: `godot/doc/classes/Engine.xml`
  - `physics_ticks_per_second`
  - `max_physics_steps_per_frame`
  - `max_fps`, `time_scale`, `physics_jitter_fix`
- Class docs: `godot/doc/classes/Time.xml`
  - `get_ticks_usec` / `get_ticks_msec`（单调计时推荐）

## Teaching Use

- 新手性能排查 4 步：
  1. 先看 `TIME_PROCESS` vs `TIME_PHYSICS_PROCESS`
  2. 再看 `RENDER_TOTAL_DRAW_CALLS_IN_FRAME`
  3. 再看对象数/内存监视器
  4. 最后再改参数（tick rate / max physics steps / fps cap）

## Fast Answer Snippet

- 先定位瓶颈域再优化；`delta` 用于积分，真实计时请用 `Time.get_ticks_usec()`。
