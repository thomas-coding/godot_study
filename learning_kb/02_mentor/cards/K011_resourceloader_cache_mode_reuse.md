# K011 - ResourceLoader cache mode and reuse

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- `ResourceLoader.load()` 默认是 `CACHE_MODE_REUSE`，同路径资源优先复用缓存；需要强制绕过/替换缓存时再显式调整 `cache_mode`。

Evidence:
- `godot/doc/classes/ResourceLoader.xml` -> `load`（默认 `cache_mode=1`）
- `godot/doc/classes/ResourceLoader.xml` -> `CACHE_MODE_REUSE/REPLACE/IGNORE` 常量说明
- `godot/core/io/resource_loader.cpp` -> `ResourceLoader::_load_start`（`CACHE_MODE_REUSE` 分支读 `ResourceCache`）

Teaching Use:
- 解释“为什么改了磁盘资源但运行中看起来没生效”的缓存语义问题。
