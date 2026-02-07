# Performance Frame Budget Checklist (Godot 4.6)

用途：当出现卡顿/掉帧时，用固定顺序定位是逻辑、物理、渲染还是内存问题。

## 0) Baseline

- 先记录测试环境（平台、分辨率、VSync、是否 debug/release）。
- 确认使用同一场景和同一操作路径复现问题。

## 1) First triage monitors

- `Performance.TIME_FPS`
- `Performance.TIME_PROCESS`
- `Performance.TIME_PHYSICS_PROCESS`
- `Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME`

## 2) Domain decision

- `TIME_PROCESS` 高：优先检查脚本逻辑、AI、遍历与分配。
- `TIME_PHYSICS_PROCESS` 高：优先检查碰撞体数量、physics tick、碰撞对数量。
- draw call 高：优先检查材质合批、可见对象数量、UI/特效过度拆分。

## 3) Timing settings sanity

- `Engine.physics_ticks_per_second` 与 `Engine.max_physics_steps_per_frame` 是否联动合理。
- `Engine.max_fps` 与 VSync 策略是否符合目标设备。
- 性能计时使用 `Time.get_ticks_usec()`，避免系统时钟波动。

## 4) Validation and compare

- 每次只改一个变量并复测。
- 记录改动前后 30 秒平均数据，避免“瞬时好运”误判。
- debug 与 release 分开结论（部分 monitor 在 release 为 0）。

## Evidence anchors

- `godot/doc/classes/Performance.xml`
- `godot/doc/classes/Engine.xml`
- `godot/doc/classes/Time.xml`
- `godot/main/performance.cpp`
