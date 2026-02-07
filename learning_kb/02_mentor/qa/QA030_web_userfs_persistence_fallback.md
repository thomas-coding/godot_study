# QA030 - Web userfs persistence fallback

Question:
- Web 平台下 `user://` 一定会持久化吗？如果不持久化怎么办？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 不一定。Web 上 `user://` 可能不持久化。
- 运行时先用 `OS.is_userfs_persistent()` 检测，再决定是否启用本地存档能力。
- 若不可持久化，给用户提示并降级到会话内进度（或云端同步方案）。

Evidence:
- `godot/doc/classes/OS.xml` -> `is_userfs_persistent`
- `godot/doc/classes/OS.xml` -> `get_user_data_dir`
