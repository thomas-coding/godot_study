# K001 - Game Loop Order

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-06
Compatibility: unchanged

Conclusion:
- 主循环一帧核心顺序是：physics substeps -> process -> render -> audio/script frame。

Evidence:
- `godot/main/main.cpp` -> `Main::iteration()`

Teaching Use:
- 用于解释 `_physics_process` 与 `_process` 的职责边界。
