# K089 - Audio Feedback Should Follow Confirmed Events

Version Scope: Godot 4.6 stable
Last Verified: 2026-07-01
Evidence Level: Working

## Claim

Play audio after gameplay logic confirms an event, not at the earliest raw collision/input observation.

## Teaching Use

For this project, trigger sound from accepted event handlers:

- coin collected after `_on_coin_collected()` accepts `PLAYING`
- hit after `_on_hazard_hit()` deducts HP
- Boss reward after `_on_boss_defeated()` grants the reward once

## Evidence

- `godot/doc/classes/AudioStreamPlayer.xml`
- `godot/doc/classes/AudioStreamPlayer2D.xml`
- `godot/doc/classes/AudioServer.xml`
- `projects/first-game/scenes/main.gd`
