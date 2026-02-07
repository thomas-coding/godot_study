# QA027 - deterministic directory traversal

Question:
- 我需要可复现的资源遍历顺序，Godot 里怎么做才稳？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 不要依赖 `list_dir_begin/get_next` 的原始顺序，它跨 OS 不稳定。
- 优先用 `get_files/get_directories`（已按字母序），或自定义排序后再处理。
- 所有回归测试和打包脚本都应固定排序策略。

Evidence:
- `godot/doc/classes/DirAccess.xml` -> `list_dir_begin`（order not deterministic）
- `godot/doc/classes/DirAccess.xml` -> `get_files/get_directories`（sorted alphabetically）
