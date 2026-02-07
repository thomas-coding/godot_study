# QA019 - detect editor/template/release runtime

Question:
- 我如何在代码里区分“编辑器运行 / 导出模板 / debug-release 模式”？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 判断是否导出模板：`OS.has_feature("template")`。
- 判断 debug/release：`OS.is_debug_build()`。
- 组合判断即可区分常见运行态（例如 editor debug、template debug、template release）。

Evidence:
- `godot/doc/classes/OS.xml` -> `has_feature`
- `godot/doc/classes/OS.xml` -> `is_debug_build` 说明（template 判断提示）
