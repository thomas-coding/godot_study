# K087 - UI state must match game state

Status: Working
Version Scope: 4.6
Last Verified: 2026-06-30
Compatibility: unchanged

Conclusion:
- HUD, menu, temporary feedback, and terminal screens should map to explicit gameplay states or explicit temporary events. Ambiguous UI ownership creates confusing input and progression bugs.

Evidence:
- `godot/doc/classes/Control.xml`
- `godot/doc/classes/CanvasLayer.xml`
- `learning_kb/00_plan/lesson_27_2h_runbook.md`
- `learning_kb/02_mentor/cards/K084_reward_popup_is_not_completion_state.md`

Teaching Use:
- Use a small UI state table before adding more panels or prompts.
