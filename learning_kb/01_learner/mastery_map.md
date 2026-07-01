# Mastery Map

状态值：`not_started` / `in_progress` / `done`

## Godot Fundamentals

- Editor launch and project creation: `done`
  - Evidence: `01_learner/daily_reports/2026-02-06.md`
- Main scene creation and run (`F5`): `done`
  - Evidence: `01_learner/daily_reports/2026-02-06.md`
- Input Map basics: `done`
  - Evidence: `01_learner/daily_reports/2026-02-06.md`
- Script attach to node: `done`
  - Evidence: `01_learner/daily_reports/2026-02-06.md`
- `CharacterBody2D` movement/jump: `done`
  - Evidence: `01_learner/daily_reports/2026-02-18.md`
- `Area2D` interaction (collect/hit trigger): `done`
  - Evidence: `01_learner/daily_reports/2026-02-19.md`
- Minimal collectible score feedback (`Label` + signal): `done`
  - Evidence: `01_learner/daily_reports/2026-02-19.md`
- Restart flow (`reload_current_scene`): `done`
  - Evidence: `01_learner/daily_reports/2026-02-19.md`
- Pause/resume flow (`SceneTree.paused` + process mode): `done`
  - Evidence: `01_learner/daily_reports/2026-02-19.md`
- Start gate (`start` -> `play`): `done`
  - Evidence: `01_learner/daily_reports/2026-02-20.md`
- Collision layer/mask convention (Player/World/Collectible): `done`
  - Evidence: `01_learner/daily_reports/2026-02-20.md`
- Hazard damage + game over loop: `done`
  - Evidence: `01_learner/daily_reports/2026-02-20.md`
- Goal win + restart loop: `done`
  - Evidence: `01_learner/daily_reports/2026-02-20.md`
- Camera2D follow: `done`
  - Evidence: `01_learner/daily_reports/2026-02-21.md`
- Gameplay state machine refactor: `done`
  - Evidence: `01_learner/daily_reports/2026-02-21.md`
- HUD scene decoupling and unified UI update API: `done`
  - Evidence: `01_learner/daily_reports/2026-02-21.md`
- Enemy patrol behavior + contact damage integration: `done`
  - Evidence: `01_learner/daily_reports/2026-02-22.md`
- Objective gate (`collect all -> unlock goal`): `done`
  - Evidence: `01_learner/daily_reports/2026-02-22.md`
- Level transition (`change_scene_to_file` + next-level configuration): `done`
  - Evidence: `01_learner/daily_reports/2026-02-24.md`
- ConfigFile save/load foundation (`user://save.cfg` + autoload `SaveManager`): `done`
  - Evidence: `01_learner/daily_reports/2026-02-25.md`
- In-game settings menu runtime apply + persistence (`audio_volume` + `window_mode`): `done`
  - Evidence: `01_learner/daily_reports/2026-02-27.md`
- Resource-driven gameplay balance config (`Resource` + `.tres` + Inspector switching): `done`
  - Evidence: `01_learner/daily_reports/2026-06-15.md`
- Profiler frame-budget sampling and curve interpretation: `done`
  - Evidence: `01_learner/daily_reports/2026-06-22.md`
- Projectile scene instancing and signal-based damage integration: `done`
  - Evidence: `01_learner/daily_reports/2026-06-23.md`
- Combat hit feedback (`HUD` hit label + player flash): `done`
  - Evidence: `01_learner/daily_reports/2026-06-23.md`
- Resource-driven projectile tuning (`enemy_shoot_cooldown`, `projectile_speed`, `projectile_lifetime`): `done`
  - Evidence: `01_learner/daily_reports/2026-06-23.md`
- Trigger-based level event system (`Area2D` trigger + custom signal + `Main` action dispatch): `done`
  - Evidence: `01_learner/daily_reports/2026-06-24.md`
- One-shot event deduplication and restart reset (`has_triggered` + `triggered_event_ids` + `reload_current_scene`): `done`
  - Evidence: `01_learner/daily_reports/2026-06-24.md`
- Event-driven wave spawning (`spawn_wave` action + `PackedScene.instantiate()` + runtime signal wiring): `done`
  - Evidence: `01_learner/daily_reports/2026-06-25.md`
- Group-based clear-wave gate unlock (`enemies` group + `tree_exited` + deferred clear check): `done`
  - Evidence: `01_learner/daily_reports/2026-06-25.md`
- Physics callback timing guard (`call_deferred` when spawning from `Area2D.body_entered`): `done`
  - Evidence: `01_learner/daily_reports/2026-06-25.md`
- Boss HP/phase state modeling (`hp_current`, `BossPhase`, threshold switch): `done`
  - Evidence: `01_learner/daily_reports/2026-06-26.md`
- Boss hit feedback and invulnerability window: `done`
  - Evidence: `01_learner/daily_reports/2026-06-26.md`
- Boss defeat and restart-stable scene-local state: `done`
  - Evidence: `01_learner/daily_reports/2026-06-26.md`
- Pause/start gate processing discipline for gameplay nodes: `done`
  - Evidence: `01_learner/daily_reports/2026-06-26.md`
- Boss defeated signal and one-time reward handling: `done`
  - Evidence: `01_learner/daily_reports/2026-06-29.md`
- HUD reward popup as display-only feedback: `done`
  - Evidence: `01_learner/daily_reports/2026-06-29.md`
- Boss reward vs Goal completion ownership boundary: `done`
  - Evidence: `01_learner/daily_reports/2026-06-29.md`

## Engineering Workflow

- Daily report output: `in_progress`
  - Evidence: `01_learner/daily_reports/2026-02-06.md`
- Session continuity via KB: `in_progress`
  - Evidence: `01_learner/progress_log.md`
- Versioned KB governance (`registry/protocol/matrix`): `done`
  - Evidence: `00_meta/version_registry.md`, `00_meta/version_upgrade_protocol.md`, `02_mentor/indexes/version_matrix.md`
- Dual-track learning governance (`learner line` + `mentor line` + fixed class SOP): `done`
  - Evidence: `00_meta/dual_track_governance.md`, `AGENTS.md`, `03_sessions/session_protocol.md`
- Mentor troubleshooting knowledge pack (`QA055` + checklists + quick map): `done`
  - Evidence: `02_mentor/qa/QA055_input_callback_choice_for_gameplay_hotkeys.md`, `04_templates/performance_frame_budget_checklist.md`, `04_templates/gameplay_state_pause_restart_troubleshooting_checklist.md`, `02_mentor/source_quick_answer_map_v1.md`
- Optimization evidence discipline (same route, same sampling window, no false attribution): `done`
  - Evidence: `01_learner/daily_reports/2026-06-22.md`
- Runtime object lifecycle explanation (`tscn` template -> `instantiate` -> `add_child` -> `_ready/_physics_process`): `done`
  - Evidence: `01_learner/daily_reports/2026-06-23.md`
- Scene instance configuration vs script handling boundary (`main.tscn` places/configures, `main.gd` handles behavior): `done`
  - Evidence: `01_learner/daily_reports/2026-06-24.md`
- Runtime scene node lifecycle for gates (`main.tscn` initial node -> runtime `queue_free` -> reload restores): `done`
  - Evidence: `01_learner/daily_reports/2026-06-25.md`
- Scene-local combat state reset (`Boss` HP/phase/defeated -> `reload_current_scene`): `done`
  - Evidence: `01_learner/daily_reports/2026-06-26.md`
- Gameplay event ownership split (`Boss` emits, `Main` decides, `HUD` displays): `done`
  - Evidence: `01_learner/daily_reports/2026-06-29.md`
- Playable vertical slice alpha regression (main route + pause/restart + no red error): `done`
  - Evidence: `01_learner/daily_reports/2026-06-30.md`
- Windows export dry run and exported package smoke test: `done`
  - Evidence: `01_learner/daily_reports/2026-06-30.md`

- Boss encounter hardening: side-contact damage, exit unlock, one-shot reward, and restart recovery: `done`
  - Evidence: `01_learner/daily_reports/2026-07-01.md`
- Complex Boss object ownership boundary (`Boss` state / `Main` rules / `HUD` display): `done`
  - Evidence: `01_learner/daily_reports/2026-07-01.md`
- Input boundary organization (`InputMap` action/key split, pause gate, UI input, rebind persistence boundary): `done`
  - Evidence: `01_learner/daily_reports/2026-07-01.md`
- Runtime gate ownership (`GameState` controls `SceneTree.paused`; gameplay nodes use `PROCESS_MODE_PAUSABLE`): `done`
  - Evidence: `01_learner/daily_reports/2026-07-01.md`

## English in Technical Context

- Read simple setup instructions: `in_progress`
- Understand core Godot terms: `in_progress`
- Write short English session summary: `in_progress`
