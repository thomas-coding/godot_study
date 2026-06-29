# K084 - Reward popup is not completion state

Status: Working
Version Scope: 4.6
Last Verified: 2026-06-29
Compatibility: unchanged

Conclusion:
- A reward popup is feedback for an event; it should not automatically imply `WON`, pause the level, or replace the explicit completion objective.

Evidence:
- `projects/first-game/scenes/hud.gd`
- `projects/first-game/scenes/hud.tscn`
- `projects/first-game/scenes/main.gd`
- `learning_kb/01_learner/daily_reports/2026-06-29.md`

Teaching Use:
- Use temporary panels for rewards and persistent terminal panels for win/game-over. Mixing them confuses both player feedback and state-machine ownership.
