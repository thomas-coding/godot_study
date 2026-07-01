# M23 - Feedback, Audio, and Data-Driven Boundaries

Version Scope: Godot 4.6 stable
Last Verified: 2026-07-01
Evidence Level: Working

## Purpose

This module supports Lesson 28-30 after the learner completes Boss, input, and UI boundary lessons.

The teaching goal is to prevent three common beginner conflations:

- Temporary feedback vs durable gameplay state.
- Audio/UI settings vs gameplay rules.
- Resource configuration vs runtime mutable state.

## Teaching Conclusions

### 1. Feedback timing should match the job

- Use direct property changes plus `SceneTree.create_timer()` for simple one-shot effects such as hit flash or temporary popup hiding.
- Use `Timer` nodes when the timer needs editor-visible configuration, reuse, or scene-level ownership.
- Use `Tween` for short code-driven interpolation such as fade, scale, or numeric smoothing.
- Use `AnimationPlayer` when the effect is authored as a reusable multi-track animation in the editor.

Evidence anchors:

- `godot/doc/classes/SceneTree.xml`
- `godot/doc/classes/Timer.xml`
- `godot/doc/classes/Tween.xml`
- `godot/doc/classes/AnimationPlayer.xml`
- Existing project: `projects/first-game/scenes/player.gd`, `boss.gd`, `hud.gd`

### 2. Audio feedback should trigger after rules confirm the event

Sound effects should be triggered from the same layer that confirms gameplay truth.

Examples:

- Coin SFX after `_on_coin_collected()` accepts the collection in `PLAYING`.
- Hit SFX after `_on_hazard_hit()` deducts HP.
- Boss reward SFX after `_on_boss_defeated()` grants the reward once.

This avoids playing a sound for a collision that is later rejected by state gates.

Evidence anchors:

- `godot/doc/classes/AudioStreamPlayer.xml`
- `godot/doc/classes/AudioStreamPlayer2D.xml`
- `godot/doc/classes/AudioServer.xml`
- Existing project: `projects/first-game/scenes/main.gd`, `hud.gd`, `save_manager.gd`

### 3. Resource files should store reusable configuration, not current run state

`Resource` is a good fit for design-time data such as movement speed, initial HP, enemy damage, projectile speed, or difficulty presets.

Runtime mutable state should stay in scene nodes or autoload state:

- `balance_config.player_hp`: initial HP config.
- `Main.hp`: current player HP.
- `Boss.hp_current`: current Boss HP.
- `Main.collected_count`: current session score.

Do not write current HP or current Boss phase back into a shared `.tres` config. If runtime mutation of a config-like object is needed, use a duplicated/local instance and document its reset/persistence rule.

Evidence anchors:

- `godot/doc/classes/Resource.xml`
- `godot/doc/classes/ResourceLoader.xml`
- Existing project: `projects/first-game/configs/game_balance_config.gd`, `balance_default.tres`, `balance_easy.tres`

## Lesson Mapping

- Lesson 28: choose between `SceneTreeTimer`, `Timer`, `Tween`, and `AnimationPlayer`.
- Lesson 29: connect audio feedback to confirmed gameplay events and keep audio settings separate.
- Lesson 30: deepen Resource boundaries and avoid mutating shared configuration as runtime state.

## Common Checks

- Does this feedback block gameplay? If yes, it may be state, not feedback.
- Can this sound play more than once from the same event? If yes, add a one-shot guard or move the trigger later.
- Is this value a starting parameter or a current session value? Starting parameters can be Resource data; current values should be runtime state.
