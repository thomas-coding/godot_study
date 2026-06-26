# QA084 - What should be recorded in the first Windows export dry run?

Question:
- 第一次 Windows 导出干跑应该记录哪些信息？

Version Scope: 4.6
Last Verified: 2026-06-26
Compatibility: unchanged

Answer (teaching-ready):
- 最小记录包含：
  - Godot version / active baseline.
  - export preset name and target.
  - debug or release export.
  - export path and generated files.
  - whether export templates were present.
  - smoke-test route.
  - pass/fail result.
  - P0/P1/P2 issue list.
  - first next fix if failed.
- 如果已经接入日志，额外记录 `OS.has_feature("template")`、`OS.is_debug_build()` 和 `OS.get_user_data_dir()`。

Evidence:
- `learning_kb/00_plan/lesson_23_2h_runbook.md`
- `learning_kb/02_mentor/automated_regression_spec_v1.md`
- `learning_kb/04_templates/windows_release_preflight_checklist.md`
- `godot/doc/classes/OS.xml`
