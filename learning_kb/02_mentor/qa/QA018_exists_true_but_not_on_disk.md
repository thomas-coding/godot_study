# QA018 - exists true but file not on disk

Question:
- 为什么 `ResourceLoader.exists(path)` 返回 true，但我在磁盘上找不到这个资源文件？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- `exists` 判断的是“可识别资源路径是否存在于加载体系中”，不严格等于“磁盘文件存在”。
- 若用了 `Resource.take_over_path`，即使资源仅在缓存中、未保存到磁盘，`exists` 也可能为 true。
- 诊断时把“缓存存在”与“落盘存在”分开验证。

Evidence:
- `godot/doc/classes/ResourceLoader.xml` -> `exists` 注意事项
- `godot/doc/classes/ResourceLoader.xml` -> `has_cached`
