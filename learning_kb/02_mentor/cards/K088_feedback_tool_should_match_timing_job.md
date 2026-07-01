# K088 - Feedback Tool Should Match Timing Job

Version Scope: Godot 4.6 stable
Last Verified: 2026-07-01
Evidence Level: Working

## Claim

Choose the feedback tool by timing shape: one-shot delay, reusable timer, interpolation, or authored animation.

## Teaching Use

- Direct property + `create_timer()`: simplest temporary feedback.
- `Timer` node: reusable or editor-configured timing.
- `Tween`: code-driven interpolation.
- `AnimationPlayer`: editor-authored multi-track sequence.

## Evidence

- `godot/doc/classes/SceneTree.xml`
- `godot/doc/classes/Timer.xml`
- `godot/doc/classes/Tween.xml`
- `godot/doc/classes/AnimationPlayer.xml`
