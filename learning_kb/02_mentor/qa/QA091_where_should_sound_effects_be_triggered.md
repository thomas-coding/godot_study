# QA091 - Where should sound effects be triggered?

Version Scope: Godot 4.6 stable
Last Verified: 2026-07-01
Evidence Level: Working

## Short Answer

Trigger sound effects after the gameplay event is accepted by the rule owner.

## Classroom Answer

Raw collision or input is often too early. The event may be rejected because the game is paused, already won, or outside `PLAYING`.

In this project:

- Coin sound belongs after `_on_coin_collected()` accepts the collection.
- Hit sound belongs after `_on_hazard_hit()` deducts HP.
- Boss reward sound belongs after `_on_boss_defeated()` grants the reward once.

## Evidence

- `godot/doc/classes/AudioStreamPlayer.xml`
- `godot/doc/classes/AudioServer.xml`
- `projects/first-game/scenes/main.gd`
