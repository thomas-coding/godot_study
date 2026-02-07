# QA029 - FileAccess flush frequency strategy

Question:
- 自动保存时我应该每次写完都 `flush()` 吗？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 不建议每次都 flush。它能提高异常退出安全性，但会带来持续磁盘写入开销。
- 推荐策略：关键里程碑（关卡结算/设置确认/退出前）flush，平时批量缓存。
- 若担心异常终止，可在较低频率定时 flush 做折中。

Evidence:
- `godot/doc/classes/FileAccess.xml` -> `flush` performance note
- `godot/doc/classes/FileAccess.xml` -> process killed note
