# K090 - Resource Config Is Not Runtime State

Version Scope: Godot 4.6 stable
Last Verified: 2026-07-01
Evidence Level: Working

## Claim

Shared `.tres` Resource files should store reusable configuration, not current session state.

## Teaching Use

- Good Resource data: initial HP, movement speed, enemy damage, projectile speed, difficulty presets.
- Runtime state: current HP, current score, Boss current phase, whether a gate has already opened.

If runtime code must mutate a config-like object, use a duplicated/local instance and document reset and persistence rules.

## Evidence

- `godot/doc/classes/Resource.xml`
- `godot/doc/classes/ResourceLoader.xml`
- `projects/first-game/configs/game_balance_config.gd`
