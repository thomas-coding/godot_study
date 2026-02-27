# Project Brief - godot_study

## Goal
- Build and ship a complete small-scale 2D game on Steam with Godot 4.6, while maintaining a reusable, versioned learning and teaching knowledge base.

## Scope
- In scope:
  - Incremental game feature delivery in `projects/first-game` based on lesson runbooks (2h per lesson) with runnable outcomes.
  - Dual-track knowledge operations in `learning_kb/` (learner progress, mentor modules/cards/QA, handoff continuity).
  - Baseline/version governance for Godot knowledge (`version_registry`, migration protocol, compatibility matrix).
  - Validation loops for gameplay stability (start/pause/restart/win/lose/scene switch/save-settings regressions).
- Out of scope:
  - Editing engine source under `godot/` unless the user explicitly asks.
  - Work not connected to the roadmap/lesson queue or mentor backlog.
  - Automatic remote push/deployment without explicit user instruction.

## Dual-Track Contract
- Keep tracks explicit:
  - Learner track: user-facing lesson execution by runbook.
  - Mentor track: prep/research and teaching asset building.
- Track switching must be explicit in-session.
- Maintain at least 3 prepared lesson runbooks ahead.
- Mentor track extra rules:
  - Pre-class prep must be sufficient so learner sessions stay continuous and smooth, and avoid long learner wait time during class.
  - During learner sessions, do not interleave mentor summaries or knowledge-base expansion; only switch to mentor wrap-up after user explicitly requests track switch.
  - Mentor prep must cover likely learner needs end-to-end, then run post-class retrospectives and self-study iteration to improve future lessons.
  - When learner lesson acceptance passes, immediately announce lesson completion and wait for learner arrangement (`答疑/文档/切导师线`) before any heavy wrap-up.
  - Heavy wrap-up tasks (documentation consolidation, learner status summary, prep, self-study, dashboard sync) run only after explicit switch to mentor track.
- Default chat style: concise Simplified Chinese.

## Teaching Delivery Guardrails (System-Level)
- Applies to all learner-session topics (UI, code, debugging, testing, release), not only node setup.
- Every teaching action must use one atomic step card with required fields: `步骤名/目标/前提/动作(对象+路径+参数)/验收/失败分叉/最小回退`.
- Task-type mandatory fields:
  - UI/editor actions: `节点名 + 精确类型 + 父路径 + 关键Inspector属性 + 常见误选`.
  - Code edits: `文件路径 + 符号位置 + 变更内容 + 预期运行结果`.
  - Debug steps: `假设 + 观测点/日志 + 判定分叉`.
  - Test/verification: `执行命令/入口 + 通过标准 + 回归范围`.
  - Git steps: `暂存范围 + 提交信息意图 + 安全边界`.
- Pre-send quality gates (all must pass): `完整性/单义性/可执行性/可验证性/可恢复性`.
- Classroom loop is strict single-step closed loop: issue one step, wait for learner result, then continue.
- Incident governance: classify and record recurrent delivery failures (`SPEC/PATH/VERIFY/SAFE/...`), then feed fixes back into templates and protocols.

## Two-File Handoff Workflow (Default)
- Start of day: external command loads `.opencode/PROJECT_BRIEF.md` then `.opencode/SESSION_STATE.md`; AI only reads manually when context is missing.
- End of day: external command writes `.opencode/SESSION_STATE.md`; AI updates manually only when explicitly requested.
- Update `.opencode/PROJECT_BRIEF.md` only when long-lived rules/scope/change-management constraints change.
- Legacy files in `learning_kb/` remain detailed evidence/history; `.opencode/` files are the compact operational layer.

## Legacy-to-Opencode Sync Matrix (Concise)
- `learning_kb/00_plan/lesson_queue.md` -> `SESSION_STATE`: lesson progress (done/next/buffer).
- `learning_kb/01_learner/current_state.md` -> `SESSION_STATE`: learner snapshot (ability/gap/next action).
- `learning_kb/02_mentor/knowledge_map.md` + `learning_kb/02_mentor/mentor_progress_dashboard.md` -> `SESSION_STATE`: mentor progress and next prep focus.
- `learning_kb/00_meta/version_registry.md` + `learning_kb/02_mentor/indexes/version_matrix.md` -> `SESSION_STATE`: active baseline and migration status.
- `learning_kb/03_sessions/handoff_latest.md` -> `SESSION_STATE`: latest actionable delta only; keep long history in `handoff_latest.md`.

## Constraints
- Tech and style constraints:
  - Engine baseline is `Godot 4.6` (`4.6-stable` source/docs baseline).
  - Execute by lesson queue and fixed SOP; learner and mentor tracks must stay explicit and not be mixed ad hoc.
  - Maintain at least 3 prepared lessons buffer in mentor prep track.
  - Keep responses concise and use simplified Chinese by default.
- Must not do:
  - Do not modify `godot/` by default.
  - Do not skip required KB continuity updates after learning sessions.
  - Do not use destructive git operations or revert unrelated user changes.
  - Do not switch tracks implicitly when learner flow is in progress.

## Important Paths
- `godot/`
- `projects/`
- `learning_kb/`

## Done Definition
- Lesson-level: runbook acceptance criteria pass with no regression to existing gameplay loop.
- Session-level: `SESSION_STATE` is refreshed (normally by external command), plus required continuity files for the active track (`daily_report`, `current_state`, `mastery_map/gap_backlog`, `docs_digest`, `mentor_progress_dashboard`, `lesson_queue`, and optional long-history handoff append).
- Milestone-level: a playable vertical slice evolves toward export/release readiness (Windows first, Steam-oriented process).

## Working Rules
- Keep responses concise.
- `.opencode/SESSION_STATE.md` is usually handled by external command; update it manually only when user asks.
- Only push to GitHub when the user explicitly asks.
