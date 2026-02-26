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
- Default chat style: concise Simplified Chinese.

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
