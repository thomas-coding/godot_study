# QA092 - Why not store current HP in a Resource?

Version Scope: Godot 4.6 stable
Last Verified: 2026-07-01
Evidence Level: Working

## Short Answer

Current HP is runtime state. A shared Resource should hold configuration such as initial HP, not the changing value during a run.

## Classroom Answer

`balance_config.player_hp` means "how much HP the player starts with." `Main.hp` means "how much HP the player has right now."

If runtime code writes current HP into a shared `.tres`, future scene instances or editor state may observe polluted config data. Keep current state in scene nodes or a dedicated save/autoload layer.

## Evidence

- `godot/doc/classes/Resource.xml`
- `projects/first-game/configs/game_balance_config.gd`
- `projects/first-game/scenes/main.gd`
