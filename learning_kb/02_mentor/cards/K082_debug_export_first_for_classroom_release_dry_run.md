# K082 - Debug export first for classroom release dry run

Status: Working
Version Scope: 4.6
Last Verified: 2026-06-26
Compatibility: unchanged

Conclusion:
- 第一次课堂导出干跑应优先使用 debug export，因为它更适合保留日志、错误信息和可诊断性；release export 应在 smoke test 稳定后再做。

Evidence:
- `learning_kb/00_plan/lesson_23_2h_runbook.md`
- `learning_kb/02_mentor/automated_regression_spec_v1.md`
- `godot/doc/classes/OS.xml` -> `is_debug_build`
- `godot/editor/export/project_export.cpp` -> `Export With Debug` option and export dialog flow.

Teaching Use:
- 课堂上遇到导出后资源或启动问题时，不急于切 release 包；先用 debug 包稳定验证路径。
