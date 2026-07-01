# QA090 - When should I use Tween, Timer, SceneTreeTimer, or AnimationPlayer?

Version Scope: Godot 4.6 stable
Last Verified: 2026-07-01
Evidence Level: Working

## Short Answer

Use the simplest tool that matches the timing shape.

## Classroom Answer

- Use `get_tree().create_timer()` for simple one-shot waits.
- Use a `Timer` node when the timer is a reusable scene component or needs editor-visible configuration.
- Use `Tween` for short property interpolation such as fade, scale, or number smoothing.
- Use `AnimationPlayer` for authored multi-track animation sequences.

## Common Mistake

Do not turn every small hit flash into a full animation system. Start simple, then move to Tween or AnimationPlayer when the effect needs smoother motion or authoring.

## Evidence

- `godot/doc/classes/SceneTree.xml`
- `godot/doc/classes/Timer.xml`
- `godot/doc/classes/Tween.xml`
- `godot/doc/classes/AnimationPlayer.xml`
