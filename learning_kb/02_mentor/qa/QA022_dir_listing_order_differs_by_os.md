# QA022 - directory listing order differs by OS

Question:
- 为什么同一目录在不同系统遍历顺序不一样？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 这是预期行为：`DirAccess.list_dir_begin()` 返回顺序不保证稳定。
- 如果逻辑依赖顺序，先收集列表，再按规则排序（字母序/自然序）。
- 对可复现实验或回归测试，必须固定排序策略。

Evidence:
- `godot/doc/classes/DirAccess.xml` -> `list_dir_begin`（order not deterministic）
