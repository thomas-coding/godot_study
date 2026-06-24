# K079 - Alpha regression scope should freeze feature expansion

Status: Working
Version Scope: 4.6
Last Verified: 2026-06-24
Compatibility: unchanged

Conclusion:
- 小型 alpha 回归阶段应冻结新增功能范围，优先验证现有系统能组成一条可重复游玩的主路线；否则回归课会变成无边界开发课。

Evidence:
- `learning_kb/00_plan/lesson_22_2h_runbook.md`
- `02_mentor/automated_regression_spec_v1.md`
- `godot/doc/classes/SceneTree.xml` -> `reload_current_scene`, `change_scene_to_file`

Teaching Use:
- 第22课开场先声明“不做新系统”，只整合和回归：start、pause、restart、event、wave/Boss、reward、scene transition。
