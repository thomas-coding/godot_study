# QA015 - runtime load fails in export build

Question:
- 编辑器里 `load("res://...")` 正常，导出后运行时加载失败，常见原因是什么？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 先检查 `ProjectSettings.editor/export/convert_text_resources_to_binary`。
- 若该项为 `true`，某些运行时文本资源加载路径会与编辑器行为不同，尤其是你依赖运行时按文本读取资源时。
- 实战上：依赖运行时 `load` 的项目，优先明确导出策略并做导出包内验证。

Evidence:
- `godot/doc/classes/ResourceLoader.xml` -> `load` 说明中的导出注意事项
- `godot/doc/classes/ProjectSettings.xml` -> `editor/export/convert_text_resources_to_binary`
