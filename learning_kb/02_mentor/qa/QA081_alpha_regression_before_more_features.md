# QA081 - Why run an alpha regression pass before adding more features?

Question:
- 为什么第22课要先做 alpha 回归，而不是继续加新敌人、新关卡或新 UI？

Version Scope: 4.6
Last Verified: 2026-06-24
Compatibility: unchanged

Answer (teaching-ready):
- 因为当前项目已经有多个会互相影响的系统：start/pause/restart、收集门控、事件触发、敌人/投射物、Boss、奖励和切关。
- 如果继续加功能但不先整合验证，后续出问题时很难判断是哪一课引入的回归。
- Alpha 回归的目标是固定一条主路线：
  - 开始游戏
  - 完成关卡目标
  - 触发事件或战斗
  - 获得奖励/结算
  - 重开或切到下一关
- 这条路线稳定后，再加内容才有可靠基线。

Evidence:
- `learning_kb/00_plan/lesson_22_2h_runbook.md`
- `godot/doc/classes/SceneTree.xml` -> `reload_current_scene`, `change_scene_to_file`
- `02_mentor/automated_regression_spec_v1.md`
