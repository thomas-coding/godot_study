# Current Learner State

Last Updated: 2026-02-20

## Snapshot

- Phase: Week 01 / 第6课完成
- Per-Lesson Budget: 2h
- Primary Goal: Build and ship a complete game with Godot on Steam
- KB Baseline: Godot 4.6 (version migration protocol enabled)

## What Is Solid

- Godot 4.6 installed and launches normally
- `first_game` project runs with `F5`
- Input actions created: `move_left`, `move_right`, `jump`
- Debug script attached and `jump` action verified
- `CharacterBody2D` player implemented with A/D movement + Space jump
- `Main` + `Player` reusable scene structure established
- Ground collision works in runtime (`StaticBody2D` + `CollisionShape2D`)
- `Area2D` collectible interaction works (`body_entered` -> `queue_free`)
- `Main` score feedback works (`collected_count` + `ScoreLabel` sync)
- Restart flow works (`R` -> `reload_current_scene`, score reset, coins respawn)
- Pause/resume works (`P` -> `SceneTree.paused` + `PauseLabel` + gameplay node pausable mode)
- Start gate flow works (`Enter` -> `start_game`, before-start input gate)
- Collision layer/mask convention applied (`Player=1`, `World=2`, `Collectible=3`)
- Hazard damage loop works (`hit` -> `hp` decrease -> `game over`)
- Goal win loop works (`reached_goal` -> `YOU WIN` -> restart)
- Versioned KB infrastructure is ready (`registry` + `upgrade protocol` + `compatibility matrix`)
- Mentor support assets upgraded: QA001~QA055, multi-domain checklists, source quick-answer map v1 (100 items)
- Dual-track governance is locked (`learner line` / `mentor line`) with fixed class SOP

## Current Gaps

- `_process(delta)` vs `_physics_process(delta)` understanding is not yet stable
- Camera follow and jitter diagnosis is not started yet
- `_unhandled_input` 分发顺序与 handled 传播机制理解尚不稳定

## Immediate Next Session Goal

Build Camera2D follow and complete a minimal jitter diagnosis workflow on top of the completed 第6课 gameplay loop.

Runbook: `00_plan/lesson_07_2h_runbook.md`

Lesson Queue: `00_plan/lesson_queue.md`

## Teaching Preferences (Stable)

- Chinese discussion is fine; English answers on request with glossary
- Prefer actionable steps and minimal runnable outcomes
- Keep long-term continuity through local KB updates
