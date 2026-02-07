# QA021 - ConfigFile changes not saved after restart

Question:
- 为什么我用 `ConfigFile.set_value()` 改了设置，重启后又没了？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- `set_value` 只改内存，不会自动落盘。
- 你需要在合适时机显式调用 `save()`（或加密版本）。
- 常见做法是“变更设置 -> 标记 dirty -> 退出前统一 save”。

Evidence:
- `godot/doc/classes/ConfigFile.xml` -> mutations are in-memory until `save`
