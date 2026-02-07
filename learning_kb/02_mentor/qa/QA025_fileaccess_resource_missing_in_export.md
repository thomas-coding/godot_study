# QA025 - FileAccess resource missing in export

Question:
- 为什么我用 `FileAccess` 读资源文件，编辑器能读，导出包却提示不存在？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 导出时资源可能被转换为引擎内部格式，原始文件不一定还在包里。
- 对资源加载优先用 `ResourceLoader`；只有明确“按原样导出”的非资源文件才适合直接 `FileAccess`。
- 导出策略与文件类型要一起设计，不要混用假设。

Evidence:
- `godot/doc/classes/FileAccess.xml` -> export note (prefer `ResourceLoader`)
- `godot/doc/classes/ProjectSettings.xml` -> `editor/export/convert_text_resources_to_binary`
