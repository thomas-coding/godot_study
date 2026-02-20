# Lesson Queue (2h per lesson)

Last Updated: 2026-02-20
Mode: 按“课次”推进（不是按自然日）

## 执行规则

- 每课默认 `2h` 任务量。
- 用户触发词：`继续学` / `学下一课` / `继续今天学习` 时，默认进入下一课。
- 单日可学习 0~N 课，不绑定“每天一课”。
- 导师线必须保持“至少提前备好 3 课”的可执行 runbook 缓冲。

## 课次队列

- 第1课（已完成，历史为1h，后续统一2h）：项目搭建与输入映射
  - 历史脚本：`learning_kb/00_plan/day_01_1h_runbook.md`
- 第2课（已完成）：`CharacterBody2D` 最小可玩
  - 历史脚本：`learning_kb/00_plan/day_02_2h_runbook.md`
- 第3课（已完成）：`Area2D` 收集 + 计分反馈
  - 历史脚本：`learning_kb/00_plan/day_03_2h_runbook.md`

- 第4课（已完成）：start gate + pause/restart 稳定化 + layer/mask 约定
  - 脚本：`learning_kb/00_plan/lesson_04_2h_runbook.md`
- 第5课（已完成）：hazard 伤害 + 失败重开闭环
  - 脚本：`learning_kb/00_plan/lesson_05_2h_runbook.md`
- 第6课（已完成）：goal 完成区 + 最小胜利流程
  - 脚本：`learning_kb/00_plan/lesson_06_2h_runbook.md`
- 第7课（已备课，下一课）：Camera2D 跟随 + 抖动排查
  - 脚本：`learning_kb/00_plan/lesson_07_2h_runbook.md`

- 第8课（待备课）：状态机重构（枚举状态 + 输入门控统一）
- 第9课（待备课）：UI/HUD 整理（分数、血量、胜负提示布局与样式）

## 备课缓冲检查

- 当前已备课缓冲：`第7课`（1 课）
- 缓冲缺口：`第8课~第9课`，等待用户触发导师线（“你学习下/你备下课”）后补齐。
