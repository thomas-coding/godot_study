# K081 - Export package needs real smoke test

Status: Working
Version Scope: 4.6
Last Verified: 2026-06-26
Compatibility: unchanged

Conclusion:
- Godot 编辑器 `F5` 通过不能替代导出包验证；Windows `.exe` 必须单独执行 smoke test，覆盖启动、资源、输入、存档和核心路线。

Evidence:
- `learning_kb/04_templates/windows_release_preflight_checklist.md`
- `learning_kb/04_templates/export_runtime_resource_loading_checklist.md`
- `godot/doc/classes/OS.xml`
- `godot/doc/classes/ResourceLoader.xml`
- `godot/doc/classes/PackedScene.xml`

Teaching Use:
- 学员问“编辑器里能跑，为什么还要导出测试？”时，用这个卡片解释导出包是不同运行形态，必须单独验收。
