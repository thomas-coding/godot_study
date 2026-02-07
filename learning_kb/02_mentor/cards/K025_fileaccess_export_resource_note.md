# K025 - FileAccess vs ResourceLoader in exports

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- 导出后访问资源文件优先 `ResourceLoader`；直接 `FileAccess` 读资源文件可能因导出转换而找不到原始文件。

Evidence:
- `godot/doc/classes/FileAccess.xml` -> 类说明（export 时推荐 `ResourceLoader`）
- `godot/doc/classes/ProjectSettings.xml` -> `editor/export/convert_text_resources_to_binary`

Teaching Use:
- 用于修复“编辑器能读、导出不能读”的资源加载路径错误。
