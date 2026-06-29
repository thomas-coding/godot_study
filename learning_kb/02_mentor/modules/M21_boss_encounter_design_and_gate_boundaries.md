# M21 - Boss encounter design and gate boundaries

Status: Working
Version Scope: 4.6
Last Verified: 2026-06-29
Compatibility: unchanged

## Core Conclusion

- Boss defeat should usually emit an event; level rules should decide reward, unlocks, and win state.
- A Boss reward popup is not the same as level completion. In the current project, Boss defeat grants score and can unlock Goal, but `Goal` remains the final win/scene-transition entry.
- A small Boss encounter needs three separate layers:
  1. combat threat: contact damage or projectile attack.
  2. encounter boundary: gate/arena/activation rules.
  3. reward and progression: one-time reward plus exit unlock.
- Teaching should not mix these into one step. First build reward signal flow, then alpha integration, then Boss threat/gate hardening.

## Evidence

- Project evidence:
  - `projects/first-game/scenes/boss.gd`
  - `projects/first-game/scenes/main.gd`
  - `projects/first-game/scenes/hud.gd`
  - `projects/first-game/scenes/main.tscn`
  - `learning_kb/01_learner/daily_reports/2026-06-29.md`
- Godot docs/source anchors:
  - `godot/doc/classes/Area2D.xml`
  - `godot/doc/classes/CharacterBody2D.xml`
  - `godot/doc/classes/Node.xml`
  - `godot/doc/classes/SceneTree.xml`
  - `godot/scene/main/node.cpp`
  - `godot/scene/main/scene_tree.cpp`

## Teaching Use

- Use this module before Lesson24.
- Stable answer:
  - Boss owns HP, phase, hit feedback, and defeat signal.
  - Main owns score, reward guard, Goal unlock, and win state.
  - HUD owns labels and temporary panels.
  - Scene layout owns readability and physical route.
- If the learner says “Boss dies and the level wins, is that okay?”, answer with the current design rule: only if Boss is explicitly the final objective. In this project, Boss is a reward/unlock event, and Goal remains the final objective.

## Fast Answer Snippet

- `Boss` says “I was defeated”; `Main` decides “give reward and unlock Goal”; `HUD` shows “Reward +5”; `Goal` still decides “level complete”.
