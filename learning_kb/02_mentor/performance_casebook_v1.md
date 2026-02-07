# Performance Casebook v1 (Godot 4.6)

Last Updated: 2026-02-07
Status: Working
Version Scope: 4.6

用途：沉淀“症状 -> 监视器 -> 根因 -> 修复动作 -> 验证”的实战模板，减少盲调。

## Case P001 - Physics-heavy slow-motion feel

- Symptom:
  - 玩家输入延迟上升，整体像慢动作。
- First monitors:
  - `TIME_PHYSICS_PROCESS`
  - `TIME_FPS`
- Root cause pattern:
  - `physics_ticks_per_second` 提高后，`max_physics_steps_per_frame` 未联动，渲染帧补不完物理步。
- Fix actions:
  1. 评估并联动调整 `physics_ticks_per_second` 与 `max_physics_steps_per_frame`。
  2. 逐项减少 physics 热点（碰撞对、活动刚体、复杂求解）。
- Validation:
  - 对比调参前后 30 秒平均 `TIME_PHYSICS_PROCESS` 与输入体感。
- Evidence:
  - `godot/doc/classes/Engine.xml` -> `physics_ticks_per_second`, `max_physics_steps_per_frame`
  - `godot/doc/classes/Performance.xml` -> `TIME_PHYSICS_PROCESS`

## Case P002 - Rendering frame-time spikes

- Symptom:
  - 视觉上间歇掉帧，逻辑响应尚可。
- First monitors:
  - `TIME_PROCESS`
  - `RENDER_TOTAL_DRAW_CALLS_IN_FRAME`
- Root cause pattern:
  - draw call 或渲染对象数过高，导致渲染阶段抖动。
- Fix actions:
  1. 降低 draw call（合并材质、减少碎片化节点）。
  2. 检查不可见对象是否仍被提交渲染。
  3. 固定测试路径，避免场景切换噪声。
- Validation:
  - 对比 draw call 与 `TIME_PROCESS` 的同步变化趋势。
- Evidence:
  - `godot/doc/classes/Performance.xml` -> `TIME_PROCESS`, `RENDER_TOTAL_DRAW_CALLS_IN_FRAME`
  - `godot/main/performance.cpp` -> `Performance::get_monitor`

## Case P003 - Threaded loading still hitches

- Symptom:
  - 已使用 `load_threaded_request`，但加载阶段仍出现卡顿峰值。
- First checks:
  - 是否在 `THREAD_LOAD_LOADED` 前调用了 `load_threaded_get()`。
  - 是否开启 `use_sub_threads=true` 导致主线程竞争。
- Root cause pattern:
  - 线程接口误用（过早 `get`）或子线程竞争导致体感抖动。
- Fix actions:
  1. 强制“`status` 到 LOADED 才 `get`”规则。
  2. 对 `use_sub_threads` 做 A/B 测试并记录峰值帧时间。
- Validation:
  - 对比加载阶段帧时间峰值与平均值。
- Evidence:
  - `godot/doc/classes/ResourceLoader.xml` -> `load_threaded_get`, `load_threaded_get_status`, `load_threaded_request`
  - `godot/core/io/resource_loader.cpp` -> `ResourceLoader::load_threaded_get_status`
