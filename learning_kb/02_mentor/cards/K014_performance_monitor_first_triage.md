# K014 - performance monitors for first triage

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- 性能排查先看 `TIME_PROCESS`、`TIME_PHYSICS_PROCESS`、`RENDER_TOTAL_DRAW_CALLS_IN_FRAME`，先判定瓶颈域再决定优化方向。

Evidence:
- `godot/doc/classes/Performance.xml` -> `get_monitor` + 关键 monitor 常量
- `godot/main/performance.cpp` -> `Performance::get_monitor`（监视器到引擎统计数据映射）

Teaching Use:
- 形成统一“先定位瓶颈域，再优化”的教学顺序，避免盲调。
