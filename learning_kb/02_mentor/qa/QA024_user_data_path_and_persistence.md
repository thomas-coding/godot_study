# QA024 - user:// path and persistence

Question:
- `user://` 实际写到哪里？在 Web 平台会一直保留吗？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 绝对路径可通过 `OS.get_user_data_dir()` 查看，位置取决于平台和项目设置。
- Web 平台上，`user://` 持久化不一定可用，建议用 `OS.is_userfs_persistent()` 检查。
- 关键存档逻辑应有“不可持久化时的降级策略”。

Evidence:
- `godot/doc/classes/OS.xml` -> `get_user_data_dir`
- `godot/doc/classes/OS.xml` -> `is_userfs_persistent`
