# Mentor Knowledge Map

Last Updated: 2026-02-07
Active Baseline: Godot 4.6

## Fast Read Order (new AI)

1. `02_mentor/indexes/module_index.md`
2. `02_mentor/indexes/card_index.md`
3. `02_mentor/indexes/qa_index.md`
4. `02_mentor/indexes/version_matrix.md`
5. `02_mentor/learning_backlog.md`
6. `02_mentor/docs_digest.md`

启动时额外读取：`00_meta/version_registry.md`

## Knowledge Domains

- Godot Core Runtime
  - Status: `in_progress`
  - Modules: M01, M02, M03

- Input and Control
  - Status: `in_progress`
  - Modules: M04

- Character Controller (2D)
  - Status: `in_progress`
  - Modules: M05

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

## Study Trigger Contract

- 当用户说“学习下godot/研究 Godot”时：
  1. 先给本次学习计划（模块 + 产出文件）
  2. 再做 docs+source 学习
  3. 回写 `modules/` + `cards/` + `qa/` + `docs_digest.md`

## Current Priority (next sessions)

1. 完成 M05 并产出 Day 2 教学清单（CharacterBody2D movement/jump）
2. 补 `_physics_process(delta)` 源码级证据链（MainLoop -> SceneTree -> Node）
3. 形成可复用教学问答模板（QA001-003 扩充到 QA010）
4. 维护版本兼容矩阵（为未来 5.0 迁移预置状态）
