# M20 - Windows export dry run and release preflight

Status: Working
Version Scope: 4.6
Last Verified: 2026-06-26
Compatibility: unchanged

## Core Conclusion

- 第一次 Windows 导出课的目标不是“正式发布”，而是验证导出工具链、导出包启动、资源加载、输入、存档和一条 playable route。
- 编辑器里 `F5` 通过不等于导出包通过。导出包需要单独 smoke test，因为资源打包、运行时路径、模板 debug/release、`user://` 路径和窗口行为都可能变化。
- 课堂默认策略应先使用 debug export，保留日志和错误信息；等 smoke test 稳定后再做 release export。
- 导出验证必须留下 dry-run 记录：构建身份、导出 preset、导出路径、测试路线、P0/P1/P2 问题列表。

## Evidence

- Class docs:
  - `godot/doc/classes/EditorExportPlatformPC.xml`
    - links to Windows export documentation for PC targets.
  - `godot/doc/classes/EditorExportPlatform.xml`
    - export template lookup and command-line argument generation.
  - `godot/doc/classes/OS.xml`
    - `has_feature`
    - `is_debug_build`
    - `get_user_data_dir`
  - `godot/doc/classes/ResourceLoader.xml`
    - runtime resource loading and threaded status flow.
  - `godot/doc/classes/PackedScene.xml`
    - `can_instantiate`
    - `instantiate`
  - `godot/doc/classes/ProjectSettings.xml`
    - export resource conversion and runtime settings.
- Source:
  - `godot/editor/export/project_export.cpp`
    - export preset UI, export filter choices, export buttons, missing-template warning UI.
- Project process:
  - `learning_kb/04_templates/windows_release_preflight_checklist.md`
  - `learning_kb/04_templates/export_runtime_resource_loading_checklist.md`
  - `learning_kb/02_mentor/automated_regression_spec_v1.md`
  - `learning_kb/02_mentor/release_risk_matrix_v1.md`
  - `learning_kb/00_plan/lesson_23_2h_runbook.md`

## Teaching Use

- Lesson23 课堂口径：
  1. 先确认第22课 alpha route 在编辑器内可用。
  2. 建立 Windows Desktop export preset。
  3. 若 export templates 缺失，把它记录为阻塞，不改成 Steam 发布课。
  4. 成功导出后立即运行 `.exe`，不只看导出成功弹窗。
  5. 用固定路线验证：boot -> start -> input -> collect -> event/wave -> Boss/result -> pause -> restart。
  6. 记录 P0/P1/P2，课堂只修 P0 和高影响 P1。

## Fast Answer Snippet

- `F5` 通过只说明编辑器运行链路可用；导出包还要单独测资源打包、模板、`user://`、输入和窗口行为。第23课先做 Windows dry run，不做正式 Steam 发布。
