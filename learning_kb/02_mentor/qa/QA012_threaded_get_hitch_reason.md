# QA012 - why threaded loading still hitches

Question:
- 我已经用 `load_threaded_request()` 了，为什么还是会卡顿？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 常见原因是你过早调用了 `load_threaded_get()`；当状态未到 `THREAD_LOAD_LOADED` 时，这个调用会阻塞当前线程。
- 正确用法是：逐帧轮询 `load_threaded_get_status()`，只在 `THREAD_LOAD_LOADED` 后再 `get`。
- 另外，`use_sub_threads=true` 可能加快加载，但也可能对主线程造成竞争，需实测。

Evidence:
- `godot/doc/classes/ResourceLoader.xml` -> `load_threaded_get`（阻塞说明）
- `godot/doc/classes/ResourceLoader.xml` -> `load_threaded_get_status`
