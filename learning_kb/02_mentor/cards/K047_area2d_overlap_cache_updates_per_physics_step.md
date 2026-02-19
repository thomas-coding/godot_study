# K047 - Area2D overlap cache updates per physics step

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-18
Compatibility: unchanged

Conclusion:
- `get_overlapping_bodies/get_overlapping_areas` 的列表不是对象移动后的即时结果，而是按物理步刷新。

Evidence:
- `godot/doc/classes/Area2D.xml` -> `get_overlapping_bodies`, `get_overlapping_areas`

Teaching Use:
- 用于解释“刚移动就查 overlap 为啥还是旧状态”，并引导改用信号。
