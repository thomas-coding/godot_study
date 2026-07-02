# Current Learner State

Last Updated: 2026-07-02

## Snapshot

- Phase: Week 01 / 第30课完成
- Per-Lesson Budget: 2h
- Lesson Prep Buffer: Lessons 27-30 completed; Lesson 31+ need new prep if continuing this track
- Primary Goal: Learn local Godot game creation and transition lessons toward the real standalone project `computer_from_scratch`
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
- Event-driven enemy wave spawning works (`WaveEventTrigger` -> `spawn_wave` -> `PackedScene.instantiate()` -> `add_child`)
- Runtime-spawned enemies join the `enemies` group and have signals connected after instancing
- Clear-wave gate logic works (`tree_exited` -> deferred group-count check -> `WaveGate.queue_free()`)
- `WaveGate(StaticBody2D)` is saved as an initial scene node and restored by `R` scene reload
- Enemy defeat by top-down stomp works for the current prototype, while side contact still damages the Player
- Enemy wall/gate collision reversal works through `is_on_wall()`
- Learner understands why `call_deferred()` is needed when spawning from an `Area2D.body_entered` callback
- Small Boss prototype works (`Boss(CharacterBody2D)` + `Hitbox(Area2D)` + `Visual(Sprite2D)`)
- Boss HP state works (`hp_max`, `hp_current`) and can be reduced by player stomp hits
- Boss hit feedback works through temporary `Visual.modulate`
- Boss invulnerability window works and prevents immediate repeated damage
- Boss phase switch works once at `hp_current <= phase2_hp_threshold`
- Boss phase behavior differs visibly: `PHASE_2` is larger and moves faster than `PHASE_1`
- Boss defeat state works (`Boss defeated` -> `queue_free()`)
- Boss respects the start gate through `process_mode = Node.PROCESS_MODE_PAUSABLE`
- Boss restart validation passed: `R` restores HP, phase, position, visibility, and start-gate pause behavior
- Learner understands that Boss state is scene-local and reset by `reload_current_scene()`
- Learner understands that `process_mode` inheritance can make gameplay nodes move while the tree is paused if not set deliberately
- Boss defeat signal works (`defeated(boss_position: Vector2)` -> `Main._on_boss_defeated`)
- Boss one-time reward works (`boss_reward_granted` prevents repeated `+5`)
- Boss reward updates the shared score and can unlock Goal without directly completing the level
- HUD result feedback works as a temporary `Boss Reward / Reward +5` popup
- Score HUD wording now reflects mixed score sources (`Score`, not only `Collected`)
- Scene layout was corrected so Boss, wave gate, and Goal no longer all overlap in the same small space
- Ground collision and visual floor now cover the moved Boss/Goal route
- Learner understands the ownership split: Boss emits event, Main owns rules/state, HUD owns display
- Learner identified and corrected a design conflict: Boss reward should not bypass the existing Goal completion flow
- Current vertical slice alpha regression passed: Start, movement/jump, collectible, Goal gate, event trigger, wave/enemy, Boss reward, Goal completion, pause, and restart form a playable main route with no observed red error
- Learner understands Lesson 22 as a current-version complete main-chain alpha regression, not final full-game testing or new feature work
- Windows export templates for Godot 4.6 were installed successfully after an initial missing-template blocker
- First Windows debug test build exported successfully to `projects/first-game/builds/windows_test/`
- Exported package smoke test passed: `first_game.exe` launches and supports cold start, start gate, movement/jump, coin collection, pause/resume, and restart
- Boss encounter hardening works: side contact damages Player, stomp damages Boss, Boss defeat opens `BossExitGate`, reward is one-shot, and Goal remains the final completion entry
- Learner can explain Boss/Main/HUD ownership boundary: Boss owns internal state and emits signals, Main owns gameplay rules, HUD displays feedback
- Boss contact logic has been organized through `_is_player_stomp(body)` helper
- Learner understands `InputMap` action names are decoupled from physical key bindings
- Learner understands `GameState -> SceneTree.paused -> PROCESS_MODE_PAUSABLE` as the current input gating chain
- Learner understands Player reads gameplay actions, Main owns state/global hotkeys, and HUD/Control handles UI input without owning gameplay rules
- Learner understands runtime `InputMap` rebinding and persisted keybinding require separate layers
- Learner can classify UI surfaces: HUD as continuous status display, Pause/Settings as menu or mode panel, Boss Reward as temporary event feedback, Game Over/You Win as terminal state.
- Learner understands feedback timing tool boundaries at a high level: short delayed feedback, cooldown windows, temporary popups, and persistent states should use different timing/animation tools.
- Basic generated audio SFX integration works in `first-game`: coin collection, player hit, and Boss reward each play a dedicated `AudioStreamPlayer` from confirmed gameplay event handlers.
- Learner understands audio volume settings are application settings through Master bus control, not gameplay rules.
- Learner confirmed Resource config vs runtime mutable state boundary; `player_hp/player_speed/required_coins` are config-style data, while `hp/hp_current/collected_count` are runtime state.
- Real project direction selected: `computer_from_scratch` will be a standalone publishable Godot 2D/2.5D game project under `D:\workspace\code\computer_from_scratch`, not a `godot_study` submodule.
- Teaching delivery issue identified: pasted GDScript snippets from chat may carry unwanted leading spaces; learner will self-correct when needed, and future code blocks should stay independent and clean
- Versioned KB infrastructure is ready (`registry` + `upgrade protocol` + `compatibility matrix`)
- Mentor support assets upgraded: QA001~QA086, multi-domain checklists, source quick-answer map v1 (165 items)
- Dual-track governance is locked (`learner line` / `mentor line`) with fixed class SOP

## Current Gaps

- Multi-level chain configuration discipline (avoid loopback and keep terminal level explicit)
- Save schema evolution discipline (field/version compatibility and fallback)
- Keybinding rebind implementation is still placeholder-only (entry exists, rebinding flow not implemented)
- Profiler domain breakdown beyond frame-time curve (`Process` vs `Physics` vs render/draw calls) needs later practice on a larger scene
- Level readability should continue to be monitored as more systems accumulate in one route
- Boss is still not a full combat threat: side-contact damage and exit gate are done, but projectile pattern and Boss-zone activation remain optional future work
- Resource sharing/mutation boundary should still be reinforced in real project data design (`Resource` data vs runtime mutable state)

## Immediate Next Session Goal

`godot_study` learner line has completed Lesson 27-30. If continuing this track, mentor prep must create Lesson 31+ runbooks.

The user is now preparing to work in the standalone real project:

`D:\workspace\code\computer_from_scratch`

First real project slice: `NAND gate -> half adder -> automated test passes`.

## Teaching Preferences (Stable)

- Chinese discussion is fine; English answers on request with glossary
- Prefer actionable steps and minimal runnable outcomes
- Keep long-term continuity through local KB updates
