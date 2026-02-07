# K012 - threaded loading: status first, then get

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- 使用线程加载时，先轮询 `load_threaded_get_status()`，再调用 `load_threaded_get()`；若资源未完成就直接 `get`，调用线程会被阻塞。

Evidence:
- `godot/doc/classes/ResourceLoader.xml` -> `load_threaded_get`（未完成时会阻塞）
- `godot/doc/classes/ResourceLoader.xml` -> `load_threaded_get_status`（推荐逐帧轮询）
- `godot/core/io/resource_loader.cpp` -> `ResourceLoader::load_threaded_get_status`

Teaching Use:
- 用于修复“明明用了 threaded loading 但仍卡顿”的常见误用。
