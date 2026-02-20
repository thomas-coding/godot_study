# Mentor Knowledge Map

Last Updated: 2026-02-20
Active Baseline: Godot 4.6

## Fast Read Order (new AI)

1. `02_mentor/indexes/module_index.md`
2. `02_mentor/indexes/card_index.md`
3. `02_mentor/indexes/qa_index.md`
4. `02_mentor/indexes/version_matrix.md`
5. `02_mentor/mentor_progress_dashboard.md`
6. `02_mentor/source_quick_answer_map_v1.md`
7. `02_mentor/performance_casebook_v1.md`
8. `02_mentor/release_risk_matrix_v1.md`
9. `02_mentor/automated_regression_spec_v1.md`
10. `02_mentor/release_rehearsal_samples_v1.md`
11. `02_mentor/learning_backlog.md`
12. `02_mentor/docs_digest.md`

启动时额外读取：`00_meta/version_registry.md`

## Knowledge Domains

- Godot Core Runtime
  - Status: `in_progress`
  - Modules: M01, M02, M03, M09, M10, M11, M12, M13

- Input and Control
  - Status: `done` (baseline)
  - Modules: M04, M13

- Character Controller (2D)
  - Status: `done` (baseline)
  - Modules: M05

- Resource Pipeline and Instancing
  - Status: `done` (baseline)
  - Modules: M07

- Performance and Frame Budget
  - Status: `done` (baseline)
  - Modules: M08

- Graphics Fundamentals (2D/3D/math)
  - Status: `planned`
  - Plan: `02_mentor/graphics_foundations.md`

- Engine Deep Dive (source-oriented)
  - Status: `planned`
  - Plan: `02_mentor/engine_deep_dive_plan.md`

## Confidence Model

- `Verified`: 有官方文档或源码证据
- `Working`: 实操可用但证据待补
- `Hypothesis`: 推测，需验证

## Version Contract

- 所有导师知识条目默认绑定 Active Baseline。
- 版本迁移统一通过 `00_meta/version_upgrade_protocol.md` 执行。
- 兼容状态统一记录在 `02_mentor/indexes/version_matrix.md`。

## Mentor Mission Contract

- 导师愿景与学习计划：`02_mentor/mentor_vision_and_self_study_plan.md`。
- 导师能力进度看板：`02_mentor/mentor_progress_dashboard.md`。
- 默认能力要求：
  - feature 问题至少给 2 个方案并说明优缺点。
  - 源码问题给函数链路与证据路径。
  - 结论必须标注可信度等级（Verified/Working/Hypothesis）。

## Study Trigger Contract

- 当用户说“学习下godot/研究 Godot/你自己学习/你先学习”时：
  1. 先给本次学习计划（模块 + 产出文件）
  2. 先检查 `00_plan/lesson_queue.md`，补齐至少 3 课备课缓冲
  3. 再做 docs+source 学习
  4. 回写 `modules/` + `cards/` + `qa/` + `docs_digest.md`

## Current Priority (next sessions)

1. 建立并扩展 source quick-answer map（v1 已完成 100 问题，下一步补到 110+）
2. 扩展 feature option playbook（当前 F001~F050，下一步目标 >=55）
3. 扩展性能与发布链路资产（已完成案例库/回归清单/风险矩阵/样本阈值带，下一步补自动化执行）
4. 维护版本兼容矩阵（为未来 5.0 迁移预置状态）
5. 每次导师自学习后刷新能力看板（当前 71%，下一目标 72%）
