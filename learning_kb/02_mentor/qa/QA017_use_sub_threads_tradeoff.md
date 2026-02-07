# QA017 - use_sub_threads trade-off

Question:
- `load_threaded_request(..., use_sub_threads=true)` 一定更好吗？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 不一定。它通常更快，但也可能增加主线程竞争，导致体感卡顿。
- 默认建议：先 `false` 建基线，再在大资源场景 A/B 测试 `true`，按实际帧时间决定。
- 不论哪种模式，都要坚持“status 先行、get 后取”的线程加载流程。

Evidence:
- `godot/doc/classes/ResourceLoader.xml` -> `load_threaded_request`（`use_sub_threads` 说明）
- `godot/doc/classes/ResourceLoader.xml` -> `load_threaded_get_status` / `load_threaded_get`
