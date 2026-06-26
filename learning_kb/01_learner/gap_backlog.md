# Gap Backlog

优先级：`P0`（必须尽快）/ `P1`（近期）/ `P2`（中期）

## P0

- Understand `_unhandled_input` dispatch order and handled propagation in practice
- Practice Profiler domain breakdown beyond frame-time curve (`Process` / `Physics` / render) on a larger scene

Reference runbook: `00_plan/lesson_21_2h_runbook.md`

## P1

- Add `Camera2D` follow without jitter
- Practice Camera2D jitter checklist on real project scene
- Reuse performance frame-budget checklist when enemy/Boss content increases scene pressure
- Practice `_process(delta)` vs `_physics_process(delta)` again when adding event/timer logic
- Practice export runtime resource-loading checklist on a test export build
- Practice Windows release preflight checklist on first playable build
- Practice signal/GUI input propagation diagnostics on a small UI scene
- Implement real keybinding rebind flow (`InputMap` update + persistence), replacing current placeholder hint
- Apply release risk matrix to first playable build and mark top 5 risks
- Add one enemy/hazard interaction using existing `Area2D` pattern
- Compare `CharacterBody2D` body collision vs `Area2D` trigger hitbox with one concrete scene
- Keep multi-level chain explicit (`01 -> 02 -> 03 -> end`) and avoid loopback misconfiguration
- Practice event ID naming discipline and collision between duplicate event IDs
- Practice Boss defeat reward/result flow with one-time reward gating and restart-safe UI state
- Practice pause/continue behavior around result panels and combat terminal states
- Run first real migration rehearsal when target version changes (e.g. 4.6 -> 5.0)

## P2

- Save schema evolution and backward compatibility checks
- Export pipeline and Steam preflight checklist
- Resource sharing/mutation boundary (`duplicate`, local-to-scene, runtime state vs config data)
