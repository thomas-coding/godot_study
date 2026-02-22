# K066 - SceneTreeTimer.get_time_left clamps value to non-negative

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-22
Compatibility: unchanged

Conclusion:
- `SceneTreeTimer::get_time_left()` 返回值会被钳制到 `>= 0`，即使内部累计已小于 0。

Evidence:
- `godot/scene/main/scene_tree.cpp` -> `SceneTreeTimer::get_time_left`

Teaching Use:
- 用于解释“打印 time_left 看不到负数”并避免错误写法依赖负值区间。
