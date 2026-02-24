# Gap Backlog

优先级：`P0`（必须尽快）/ `P1`（近期）/ `P2`（中期）

## P0

- Understand `_process(delta)` vs `_physics_process(delta)` in practice
- Understand `_unhandled_input` dispatch order and handled propagation in practice

Reference runbook: `00_plan/lesson_13_2h_runbook.md`

## P1

- Add `Camera2D` follow without jitter
- Practice Camera2D jitter checklist on real project scene
- Practice performance frame-budget checklist on current project
- Practice export runtime resource-loading checklist on a test export build
- Practice Windows release preflight checklist on first playable build
- Practice signal/GUI input propagation diagnostics on a small UI scene
- Apply release risk matrix to first playable build and mark top 5 risks
- Add one enemy/hazard interaction using existing `Area2D` pattern
- Compare `CharacterBody2D` body collision vs `Area2D` trigger hitbox with one concrete scene
- Keep multi-level chain explicit (`01 -> 02 -> 03 -> end`) and avoid loopback misconfiguration
- Run first real migration rehearsal when target version changes (e.g. 4.6 -> 5.0)

## P2

- Data-driven design with `Resource`
- Save/load and settings management
- Export pipeline and Steam preflight checklist
