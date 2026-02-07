# K023 - DirAccess listing order is non-deterministic

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- `DirAccess.list_dir_begin()` + `get_next()` 返回顺序不保证稳定，跨 OS 可能不同；要确定顺序应改用 `get_files/get_directories` 并排序。

Evidence:
- `godot/doc/classes/DirAccess.xml` -> `list_dir_begin` 说明（order not deterministic）

Teaching Use:
- 用于排查“资源遍历顺序在不同机器不一致”导致的行为差异。
