# K020 - template build check vs debug build check

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- 判断是否导出模板运行，优先用 `OS.has_feature("template")`；`OS.is_debug_build()` 只区分 debug/release 模板（编辑器下也会是 true）。

Evidence:
- `godot/doc/classes/OS.xml` -> `is_debug_build` 说明（明确建议 `OS.has_feature("template")`）
- `godot/doc/classes/OS.xml` -> `has_feature`

Teaching Use:
- 用于构建“编辑器与导出环境差异”分支逻辑的可靠检测。
