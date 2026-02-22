# Current Learner State

Last Updated: 2026-02-22

## Snapshot

- Phase: Week 01 / 第10课完成
- Per-Lesson Budget: 2h
- Lesson Prep Buffer: Lessons 11-17 ready
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
- Camera2D follow works (`Camera2D` + smoothing baseline validated)
- Gameplay state machine refactor works (`WAIT_START/PLAYING/PAUSED/GAME_OVER/WON`)
- HUD decoupling works (`CanvasLayer HUD` + unified UI update methods)
- Enemy patrol + contact damage loop works (`Enemy(CharacterBody2D)` + `Hitbox(Area2D)` + state-gated hp deduction)
- Versioned KB infrastructure is ready (`registry` + `upgrade protocol` + `compatibility matrix`)
- Mentor support assets upgraded: QA001~QA055, multi-domain checklists, source quick-answer map v1 (100 items)
- Dual-track governance is locked (`learner line` / `mentor line`) with fixed class SOP

## Current Gaps

- `_process(delta)` vs `_physics_process(delta)` understanding is not yet stable
- `_unhandled_input` 分发顺序与 handled 传播机制理解尚不稳定
- Goal unlock gate (`collect all coins` before goal active) is not started yet

## Immediate Next Session Goal

Build an objective gate loop: goal is locked until all required collectibles are finished.

Runbook: `00_plan/lesson_11_2h_runbook.md`

Lesson Queue: `00_plan/lesson_queue.md`
- Next prepared lessons: `lesson_12_2h_runbook.md`, `lesson_13_2h_runbook.md`

## Teaching Preferences (Stable)

- Chinese discussion is fine; English answers on request with glossary
- Prefer actionable steps and minimal runnable outcomes
- Keep long-term continuity through local KB updates
