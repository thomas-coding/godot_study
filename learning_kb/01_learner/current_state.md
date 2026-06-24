# Current Learner State

Last Updated: 2026-06-24

## Snapshot

- Phase: Week 01 / 第18课完成
- Per-Lesson Budget: 2h
- Lesson Prep Buffer: Lessons 19-22 ready
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
- Objective gate loop works (`collect all -> unlock goal` + progress feedback + restart reset)
- Level transition loop works (`change_scene_to_file` + exported next-level path + reset consistency)
- ConfigFile save/settings foundation works (`SaveManager` autoload + `user://save.cfg` persistence for best score/unlocked level/audio volume)
- In-game settings menu loop works (`SettingsButton` + `SettingsPanel` + pause-state-only entry)
- Runtime settings apply works (`AudioServer` volume + `DisplayServer` window mode)
- Settings persistence loop expanded (`audio_volume` + `window_mode`) and restart validation passed
- Embedded-run environment caveat is understood (window-mode visual validation must use standalone window)
- Resource-driven gameplay config works (`GameBalanceConfig` + `balance_default.tres` / `balance_easy.tres`)
- Player speed/jump, initial HP, enemy patrol speed/damage, and required coins can be driven by `.tres`
- Inspector-level config switching works and default/easy balance regression passed
- Godot Profiler basic sampling works for the current playable slice
- Frame budget baseline is understood (`60 FPS ~= 16.6ms`)
- Learner can distinguish current `Frame Time` value, curve spikes, startup sampling noise, and runtime pressure-route data
- `Physics Frame Time ~= 16.6ms` is understood as 60Hz physics cadence, not direct physics computation cost
- Performance conclusion discipline improved: do not claim optimization gain without same-window before/after evidence
- `main.gd` debug output is now gated by `debug_logs`, reducing default console noise without changing gameplay semantics
- Projectile enemy extension works (`Projectile(Area2D)` scene + `projectile.gd` movement/lifetime/hit signal)
- Enemy projectile firing loop works (`Enemy` instantiates `projectile.tscn`, emits `fired_projectile`, `Main.add_child` inserts it into the active scene)
- Learner understands the lifecycle split: `projectile.gd` as behavior, `projectile.tscn` as reusable object template, `instantiate()` as creating runtime instances
- Learner understands `_physics_process(delta)` as per-physics-frame update and `delta` as elapsed seconds for frame-rate-independent movement/lifetime
- Learner understands `Vector2(20, -8)` as spawn offset, separate from projectile flight direction
- Combat feedback loop works: HUD `HIT!` feedback and Player sprite hit flash both trigger on damage
- Projectile tuning is Resource-driven (`enemy_shoot_cooldown`, `projectile_speed`, `projectile_lifetime`) with default/easy regression passed
- Minimal trigger-based event system works (`EventTrigger(Area2D)` + `triggered(event_id, target_action)` signal)
- `Main/IntroEventTrigger` can drive HUD feedback through `target_action=show_message`
- One-shot event protection works at two levels: local `has_triggered` on the trigger and scene-level `triggered_event_ids` in `Main`
- Empty `event_id` protection works and surfaces as a yellow Debugger warning without crashing gameplay
- Restart validation passed: `R` reloads the scene and restores event trigger state
- Learner understands the split: `main.tscn` places/configures the trigger, while `main.gd` handles the received event action
- Learner understands `match` as GDScript action dispatch similar to `switch/case`
- Teaching delivery issue identified: pasted GDScript snippets from chat may carry unwanted leading spaces; learner will self-correct when needed, and future code blocks should stay independent and clean
- Versioned KB infrastructure is ready (`registry` + `upgrade protocol` + `compatibility matrix`)
- Mentor support assets upgraded: QA001~QA065, multi-domain checklists, source quick-answer map v1 (120 items)
- Dual-track governance is locked (`learner line` / `mentor line`) with fixed class SOP

## Current Gaps

- `_unhandled_input` 分发顺序与 handled 传播机制理解尚不稳定
- Multi-level chain configuration discipline (avoid loopback and keep terminal level explicit)
- Save schema evolution discipline (field/version compatibility and fallback)
- Keybinding rebind implementation is still placeholder-only (entry exists, rebinding flow not implemented)
- Resource sharing/mutation boundary should be reinforced later (`Resource` data vs runtime mutable state)
- Profiler domain breakdown beyond frame-time curve (`Process` vs `Physics` vs render/draw calls) needs later practice on a larger scene
- Event system will need escalation from single HUD message to gameplay actions: wave spawning, gate unlock, and clear-state validation

## Immediate Next Session Goal

Start Lesson 19 and link trigger events with enemy wave spawning and gate unlock logic.

Runbook: `00_plan/lesson_19_2h_runbook.md`

Lesson Queue: `00_plan/lesson_queue.md`
- Next prepared lessons: `lesson_20_2h_runbook.md`, `lesson_21_2h_runbook.md`, `lesson_22_2h_runbook.md`

## Teaching Preferences (Stable)

- Chinese discussion is fine; English answers on request with glossary
- Prefer actionable steps and minimal runnable outcomes
- Keep long-term continuity through local KB updates
