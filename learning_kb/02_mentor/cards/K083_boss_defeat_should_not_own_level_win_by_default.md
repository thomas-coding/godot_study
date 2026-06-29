# K083 - Boss defeat should not own level win by default

Status: Working
Version Scope: 4.6
Last Verified: 2026-06-29
Compatibility: unchanged

Conclusion:
- Boss defeat should emit a domain event by default; level completion should remain in `Main`/Goal rules unless the design explicitly says the Boss is the final objective.

Evidence:
- `projects/first-game/scenes/boss.gd`
- `projects/first-game/scenes/main.gd`
- `learning_kb/02_mentor/modules/M21_boss_encounter_design_and_gate_boundaries.md`
- `godot/doc/classes/Object.xml` signal model.

Teaching Use:
- Keep Boss script focused on Boss-local state. Do not let it directly control score, HUD, scene transition, or save progression.
