# QA086 - How do we turn a reward Boss into a real encounter?

Question:
- 当前 Boss 只是被打败后给奖励，怎么变成真正的 Boss 战？

Version Scope: 4.6
Last Verified: 2026-06-29
Compatibility: unchanged

Answer (teaching-ready):
- 分三层做，不要一次混在一起：
  1. Combat threat：侧面接触扣玩家 HP，或二阶段发射已有 projectile。
  2. Encounter boundary：Boss 区域有出口门，Boss 未死前不能直接通过。
  3. Progression reward：Boss 死亡只发一次奖励，并打开出口/解锁 Goal。
- 最小课堂路线是先做接触伤害，再做出口门，再考虑二阶段投射物。

Evidence:
- `learning_kb/00_plan/lesson_24_2h_runbook.md`
- `learning_kb/02_mentor/modules/M21_boss_encounter_design_and_gate_boundaries.md`
- `godot/doc/classes/Area2D.xml`
- `godot/doc/classes/CharacterBody2D.xml`
- `godot/doc/classes/Node.xml`

Validation:
- 从上方踩 Boss 扣 Boss HP。
- 侧面碰 Boss 扣玩家 HP。
- Boss 死后出口打开。
- `R` 重开恢复 Boss 和出口门。
