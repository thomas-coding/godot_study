# Gap Backlog

优先级：`P0`（必须尽快）/ `P1`（近期）/ `P2`（中期）

## P0

- Practice Profiler domain breakdown beyond frame-time curve (`Process` / `Physics` / render) on a larger scene

Reference runbook: `00_plan/lesson_27_2h_runbook.md`

## P1

- Add `Camera2D` follow without jitter
- Practice Camera2D jitter checklist on real project scene
- Reuse performance frame-budget checklist when enemy/Boss content increases scene pressure
- Practice `_process(delta)` vs `_physics_process(delta)` again when adding event/timer logic
- Practice export runtime resource-loading checklist on a fuller gameplay route
- Practice Windows release preflight checklist on a non-debug playable build later
- Practice signal/GUI input propagation diagnostics on a small UI scene
- Implement real keybinding rebind flow (`InputMap` update + persistence), replacing current placeholder hint
- Apply release risk matrix to first playable build and mark top 5 risks
- Add one enemy/hazard interaction using existing `Area2D` pattern
- Compare `CharacterBody2D` body collision vs `Area2D` trigger hitbox with one concrete scene
- Keep multi-level chain explicit (`01 -> 02 -> 03 -> end`) and avoid loopback misconfiguration
- Practice event ID naming discipline and collision between duplicate event IDs
- Continue monitoring level readability and route spacing as future systems accumulate in one scene
- Practice Boss-zone activation and optional projectile attack after basic side-contact damage and exit unlock are stable
- Practice pause/continue behavior around temporary reward popups and real terminal states
- Run first real migration rehearsal when target version changes (e.g. 4.6 -> 5.0)
- Design first real-project circuit simulation slice in `computer_from_scratch`

## P2

- Save schema evolution and backward compatibility checks
- Export pipeline release/debug differences and build identity checks
- Resource sharing/mutation boundary (`duplicate`, local-to-scene, runtime state vs config data)
