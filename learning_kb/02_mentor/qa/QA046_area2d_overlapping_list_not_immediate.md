# QA046 - Area2D overlap list is not immediate after movement

Question:
- 为什么物体刚移动后立刻查 `get_overlapping_bodies()`，结果像是延迟一帧？

Version Scope: 4.6
Last Verified: 2026-02-18
Compatibility: unchanged

Answer (teaching-ready):
- 这是引擎设计：overlap 列表按物理步统一刷新，不是“移动后即时更新”。
- 实时交互优先用 `body_entered/body_exited` 信号。
- 若必须轮询，理解它是“上一物理步快照”。

Evidence:
- `godot/doc/classes/Area2D.xml` -> `get_overlapping_bodies`, `overlaps_body`
