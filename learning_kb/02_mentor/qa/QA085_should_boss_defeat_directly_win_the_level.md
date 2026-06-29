# QA085 - Should Boss defeat directly win the level?

Question:
- Boss 被打败后，是不是应该直接通关？

Version Scope: 4.6
Last Verified: 2026-06-29
Compatibility: unchanged

Answer (teaching-ready):
- 不一定。只有当 Boss 明确就是本关最终目标时，Boss 击败才应该直接进入胜利。
- 当前项目里更合理的规则是：
  - Boss 负责发出 `defeated` 信号。
  - `Main` 发放一次性奖励，并刷新 Goal 解锁。
  - `HUD` 显示短暂奖励提示。
  - 玩家仍然要走到 Goal 才触发 `WON` 和切关。
- 这样可以保留原来的 “收集/得分 -> Goal 解锁 -> 到达 Goal 通关” 主线，不会让 Boss 奖励绕过关卡目标。

Evidence:
- `projects/first-game/scenes/boss.gd`
- `projects/first-game/scenes/main.gd`
- `projects/first-game/scenes/hud.gd`
- `learning_kb/02_mentor/modules/M21_boss_encounter_design_and_gate_boundaries.md`

Validation:
- 击败 Boss 后应看到 `Boss Reward / Reward +5`。
- 游戏状态仍可继续 PLAYING。
- Goal 解锁后，只有触碰 Goal 才进入 `WON`。
