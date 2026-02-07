# K017 - TIME_FPS update cadence

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- `Performance.TIME_FPS` 是“最近 1 秒渲染帧数”，即使你每帧读取，它也不是每帧都更新。

Evidence:
- `godot/doc/classes/Performance.xml` -> `TIME_FPS` 说明（only updated once per second）

Teaching Use:
- 解释“我每帧打印 FPS 但数字不连续变化”的现象，避免误判采样逻辑。
