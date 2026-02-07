# K019 - ResourceLoader.exists cache caveat

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- `ResourceLoader.exists(path)` 可能因 `Resource.take_over_path` 返回 `true`，即使资源未落盘；它不等价于“磁盘文件存在”。

Evidence:
- `godot/doc/classes/ResourceLoader.xml` -> `exists` 说明（`take_over_path` 注意事项）

Teaching Use:
- 用于排查“exists=true 但导出包找不到文件”的混淆。
