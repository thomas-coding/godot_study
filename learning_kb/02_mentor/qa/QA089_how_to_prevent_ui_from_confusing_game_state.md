# QA089 - How do we prevent UI from confusing game state?

Question:
- 怎么避免 HUD、暂停菜单、设置面板、Boss 奖励、胜利失败提示互相混淆？

Version Scope: 4.6
Last Verified: 2026-06-30
Compatibility: unchanged

Answer (teaching-ready):
- 先做一张 UI 状态表，而不是直接加控件。
- 每个 UI 元素必须属于一种明确类型：
  - persistent HUD：分数、HP、目标。
  - modal/menu：暂停、设置。
  - temporary feedback：Boss reward、hit feedback。
  - terminal state：win、game over。
- 如果一个 UI 同时像奖励又像通关提示，就应该拆开。

Evidence:
- `learning_kb/00_plan/lesson_27_2h_runbook.md`
- `learning_kb/02_mentor/cards/K087_ui_state_must_match_game_state.md`
- `learning_kb/02_mentor/cards/K084_reward_popup_is_not_completion_state.md`

Validation:
- 对每个 UI 写出：出现状态、允许输入、关闭方式、`R` 重开后期望。
