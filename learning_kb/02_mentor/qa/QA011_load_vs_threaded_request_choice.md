# QA011 - load vs threaded_request choice

Question:
- 什么时候用 `ResourceLoader.load()`，什么时候用 `load_threaded_request()`？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 小资源、启动阶段或不敏感路径，优先 `load()`（简单、同步语义清晰）。
- 大资源或运行中切场景预热，优先 `load_threaded_request()` + `load_threaded_get_status()` 逐帧轮询。
- 核心原则：能接受同步阻塞就用 `load`，不能接受就用 threaded 并做状态机。

Evidence:
- `godot/doc/classes/ResourceLoader.xml` -> `load`
- `godot/doc/classes/ResourceLoader.xml` -> `load_threaded_request`, `load_threaded_get_status`
