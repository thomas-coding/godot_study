# Session Handoff (Latest)

Date: 2026-02-22

## What was completed

- Day 1 done: Godot installed, project runs with `F5`, Input Map created, `jump` verified.
- KB now supports versioned continuity:
  - `00_meta/version_registry.md`
  - `00_meta/version_upgrade_protocol.md`
  - `02_mentor/indexes/version_matrix.md`
- Upgrade trigger flow is wired: `更新知识库到godot X.Y / 升级知识库到 X.Y / 切换到 Godot X.Y`.
- Existing modules/cards/qa now include version metadata (`Version Scope`, `Last Verified`, `Compatibility`).
- Mentor mission is now explicit: build Godot expert-level teaching capability with fast source-backed answers and multi-solution guidance.
- Self-study trigger is expanded: `学习下godot / 你自己学习 / 你先学习 / 你备下课 / 备课`.
- 课程组织已切换为“课次制”（不是按自然日）：
  - 学员触发词增加 `继续学 / 学下一课 / 第X课`。
  - 导师触发词增加 `你备下课 / 备课`。
  - 每课默认 2h。
  - 导师线目标为“至少提前 3 课”备课缓冲（见 `00_plan/lesson_queue.md`，当前维持在 12~17 课）。
  - 新增并对齐第4~第6课 runbook：`lesson_04_2h_runbook.md`、`lesson_05_2h_runbook.md`、`lesson_06_2h_runbook.md`。
  - 新增执行保护：学员线进行中不切导师线备课，避免学员等待；仅在用户明确触发后切导师线。
- Mentor self-study cycle executed (2026-02-07):
  - M05 upgraded with Day2 teaching checklist.
  - QA expanded to QA010 (`QA004`~`QA010` added).
  - Cards expanded to K010 (`K005`~`K010` added).
  - M06 completed (`Camera2D` follow/jitter diagnosis).
  - Built source quick-answer map v1 (10 high-frequency questions).
  - Added troubleshooting template and feature option playbook v1.
- Mentor self-study cycle continued:
  - M07 completed (`Resource` loading + scene instancing).
  - M08 completed (`Performance` monitoring + frame budget).
  - QA expanded to QA015 (`QA011`~`QA015` added).
  - Cards expanded to K016 (`K011`~`K016` added).
  - Source quick-answer map expanded from 10 to 20 questions.
  - Feature playbook expanded from F005 to F010.
  - Added D4/D5 checklists (performance + export runtime loading).
- Mentor self-study cycle continued again:
  - QA expanded to QA020 (`QA016`~`QA020` added).
  - Cards expanded to K021 (`K017`~`K021` added).
  - Source quick-answer map expanded from 20 to 30 questions.
  - Feature playbook expanded from F010 to F015.
  - Added `performance_casebook_v1.md` (3 cases) + Windows release preflight checklist.
- Mentor self-study cycle continued further:
  - QA expanded to QA025 (`QA021`~`QA025` added).
  - Cards expanded to K026 (`K022`~`K026` added).
  - Source quick-answer map expanded from 30 to 40 questions.
  - Feature playbook expanded from F015 to F020.
  - Added `release_risk_matrix_v1.md` + `automated_regression_spec_v1.md`.
- Mentor self-study cycle continued again:
  - QA expanded to QA030 (`QA026`~`QA030` added).
  - Cards expanded to K031 (`K027`~`K031` added).
  - Source quick-answer map expanded from 40 to 50 questions.
  - Feature playbook expanded from F020 to F025.
  - Added `release_rehearsal_samples_v1.md` and linked it to risk matrix.
- Mentor self-study cycle continued further:
  - Completed M09 (`SceneTree` group orchestration + persistence boundary + runtime render controls).
  - QA expanded to QA035 (`QA031`~`QA035` added).
  - Cards expanded to K036 (`K032`~`K036` added).
  - Source quick-answer map expanded from 50 to 60 questions.
  - Feature playbook expanded from F025 to F030.
- Mentor self-study cycle continued again:
  - Completed M10 (`Scene` switch timing + timer order + JSON resource runtime semantics).
  - QA expanded to QA040 (`QA036`~`QA040` added).
  - Cards expanded to K041 (`K037`~`K041` added).
  - Source quick-answer map expanded from 60 to 70 questions.
  - Feature playbook expanded from F030 to F035.
  - Upgraded release rehearsal samples to real build records (`RRB-001~RRB-003`) with artifacts summary.
- Mentor self-study cycle continued further:
  - Completed M11 (`Signal` dispatch + GUI input propagation + pause-aware processing).
  - QA expanded to QA045 (`QA041`~`QA045` added).
  - Cards expanded to K046 (`K042`~`K046` added).
  - Source quick-answer map expanded from 70 to 80 questions.
  - Feature playbook expanded from F035 to F040.
  - Release regression records expanded to `RRB-001~RRB-005` and threshold band baseline established (`rrb_threshold_band_v1.json`).
- 双轨治理规则已固化：
  - 新增 `00_meta/dual_track_governance.md`（长期双轨规则）。
  - `AGENTS.md` 与 `session_protocol.md` 已写入“轨道判定 + 固定课堂SOP + 导师线必须输出学员下节计划”。
  - `week_01_bootstrap.md` 已对齐 Day2 学员课程定义。
- 学员线 Day2 课堂已完成（按固定SOP）：
  - 已完成 `CharacterBody2D` 最小可玩：A/D 移动、Space 跳跃、地面碰撞。
  - 已建立 `Main` + `Player` 子场景结构并通过运行验收。
- 导师线课前自学习已完成（为 Day3 学员课准备）：
  - 新增 M12（`Area2D` 交互流 + layer/mask + 回调时序 + 安全回收）。
  - QA 扩展到 QA050（新增 QA046~QA050）。
  - 卡片扩展到 K051（新增 K047~K051）。
  - source quick-answer map 扩展到 90（SQ81~SQ90）。
  - feature playbook 扩展到 F045。
  - 新增 `00_plan/day_03_2h_runbook.md` 与 `04_templates/area2d_interaction_troubleshooting_checklist.md`。
- 学员线 Day3 课堂已完成（按固定SOP）：
  - 已完成 `Coin(Area2D)` 可收集交互（`body_entered` 触发 + `queue_free` 回收）。
  - 已完成最小计数反馈闭环（控制台打印 + 左上角 `ScoreLabel` 同步更新）。
  - 运行验收通过：收集生效、计数正确、无红色报错。
  - 课堂扩展已完成：`R` 重开（重载场景后 coin 恢复、分数归零）与 `P` 暂停/恢复（`PauseLabel` 同步）。
  - 已修复暂停不生效问题：`Main` 保持 `PROCESS_MODE_ALWAYS`，玩法节点改为 `PROCESS_MODE_PAUSABLE`。
- 学员线第4~第6课已完成（按固定SOP）：
  - 第4课：完成 `start_game` 入口门控与 `StartLabel`，并固化 `layer/mask` 约定。
  - 第5课：完成 `Hazard` 伤害闭环（`hit -> hp -> game over -> restart`）。
  - 第6课：完成 `Goal` 胜利闭环（`reached_goal -> YOU WIN -> restart`）。
  - 运行回归通过：start/play、collect/score、pause/resume、game over、win、restart。
- 学员线第7~第9课已完成（按固定SOP）：
  - 第7课：完成 `Camera2D` 跟随与 smoothing 基线验证。
  - 第8课：完成单状态机重构（`WAIT_START/PLAYING/PAUSED/GAME_OVER/WON`）。
  - 第9课：完成 `HUD(CanvasLayer)` 解耦与统一 UI 更新接口。
  - 运行回归通过：状态切换、胜负终态、重开与 UI 提示一致。
- 学员线第10课已完成（按固定SOP）：
  - 完成 `Enemy(CharacterBody2D)` 场景与两点巡逻（边界反向 + 朝向翻转）。
  - 完成 `Area2D Hitbox` 接触伤害信号接线，并复用主流程 hp 扣减逻辑。
  - 状态机门控通过：仅 `PLAYING` 扣血，`GAME_OVER/WON` 无终态穿透伤害。
  - 学员已掌握 `global_position` 与 Camera 的关系、body collision 与 hitbox trigger 的职责差异。
- 学员线第11课已完成（按固定SOP）：
  - 完成收集门控闭环：`total_coins/remaining_coins/goal_unlocked`。
  - 完成 Goal 条件触发：未收集完成前拒绝通关，收集完成后允许 `WON`。
  - 完成 HUD 目标状态提示：`Goal: LOCKED/UNLOCKED (x/y)`。
  - 运行回归通过：未解锁不通关、解锁后可通关、`R` 重开恢复锁定初始态。
- 导师线自学习已完成（本轮触发）：
  - 新增 `M14`（场景切换一致性 + `scene_changed` 同步点 + 状态边界）。
  - 新增 `K057~K061` 与 `QA056~QA060`（关卡切换空窗期/失败码/重开语义）。
  - source quick-answer map 扩展到 110（`SQ101~SQ110`）。
  - feature playbook 扩展到 F055（`F051~F055`）。
- 导师线自学习已继续完成（本轮触发）：
  - 新增 `M15`（SceneTreeTimer 暂停/时间缩放/更新顺序语义）。
  - 新增 `K062~K066` 与 `QA061~QA065`（timer 生命周期、pause gate、reentrant 回调时序）。
  - source quick-answer map 扩展到 120（`SQ111~SQ120`）。
  - feature playbook 扩展到 F060（`F056~F060`）。
- 导师线课前自学习已完成（为第4课学员课准备）：
  - 新增 M13（输入分发顺序 + pause gate + scene reload 语义）。
  - QA 扩展到 QA055（新增 QA051~QA055）。
  - 卡片扩展到 K056（新增 K052~K056）。
  - source quick-answer map 扩展到 100（SQ91~SQ100）。
  - feature playbook 扩展到 F050。
  - 新增 `00_plan/lesson_04_2h_runbook.md` 与 `04_templates/gameplay_state_pause_restart_troubleshooting_checklist.md`。
- 导师线备课已补齐（本轮触发）：
  - 新增 `00_plan/lesson_10_2h_runbook.md`（敌人巡逻 + 接触伤害）。
  - 新增 `00_plan/lesson_11_2h_runbook.md`（收集门控后解锁 Goal）。
  - 新增 `00_plan/lesson_12_2h_runbook.md`（Level1 -> Level2 关卡切换）。
  - 新增 `00_plan/lesson_13_2h_runbook.md`（存档与设置基础：ConfigFile）。
  - 新增 `00_plan/lesson_14_2h_runbook.md`（设置菜单：音量/窗口/快捷键入口）。
  - 新增 `00_plan/lesson_15_2h_runbook.md`（数据驱动参数：Resource）。
  - 新增 `00_plan/lesson_16_2h_runbook.md`（性能优化与帧预算回归）。
  - 新增 `00_plan/lesson_17_2h_runbook.md`（敌人扩展：追踪/投射物与战斗反馈）。
  - `lesson_queue` 备课缓冲扩展为 `第10课~第17课`（8课），第10/11课完成后当前有效缓冲为 `第12课~第17课`（6课）。
- Mentor progress dashboard is active: current progress `73%`, sprint target `74%`.

## Active baseline

- Current engine baseline: `Godot 4.6`
- Migration state: `steady`
- Source/docs baseline:
  - local source branch: `4.6-stable`
  - docs channel: `https://docs.godotengine.org/en/stable/`
- Mentor capability baseline:
  - dashboard: `02_mentor/mentor_progress_dashboard.md`
  - current overall: `73%`

## Current learner state

- Level: Godot beginner from zero, strong C/C++ engineering background.
- Confirmed skills: project setup, main scene run, input action creation, debug script attach.
- Confirmed new skills: `CharacterBody2D` movement/jump + ground collision + `Area2D` collectible/hazard/goal loop + start/pause/restart + game over/win gating + enemy patrol/contact-damage integration + objective gate unlock flow.
- Missing next: build Level 1 -> Level 2 transition and continue vertical slice depth.

## 学员线下一节课计划（第12课）

- 课程目标：完成关卡切换最小闭环（Level 1 通关后进入 Level 2）。
- 执行脚本：`00_plan/lesson_12_2h_runbook.md`。
- 验收点：
  1. Level 1 通关后可切换到 Level 2
  2. Level 2 初始化状态正确（HUD/状态机不乱）
  3. 重开后场景与状态恢复可预期
- 排错模板：`04_templates/area2d_interaction_troubleshooting_checklist.md`。

## Next session objective (Lesson 12 prep, 2h)

Build a minimal scene transition from Level 1 to Level 2 with stable state/HUD behavior.

## First files to read next time

1. `01_learner/current_state.md`
2. `01_learner/mastery_map.md`
3. `01_learner/gap_backlog.md`
4. `00_plan/lesson_queue.md`
5. `02_mentor/knowledge_map.md`
6. `00_meta/version_registry.md`
7. `00_meta/dual_track_governance.md`
8. `02_mentor/mentor_progress_dashboard.md`

## If user says "学习下godot / 你自己学习"

1. Use mentor study mode from `AGENTS.md` and `02_mentor/expert_study_protocol.md`.
2. Follow `02_mentor/mentor_vision_and_self_study_plan.md` as the default plan.
3. Output a module plan first, then study docs+source, then write back to mentor KB.

## If user says "更新知识库到godot X.Y"

1. Read `00_meta/version_registry.md` + `00_meta/version_upgrade_protocol.md` + `02_mentor/indexes/version_matrix.md`.
2. Switch Active Baseline and set migration state to `in_migration`.
3. Re-verify high-priority modules/cards/qa and update matrix statuses.
4. Update `02_mentor/docs_digest.md` and this handoff with migration progress.

## Suggested first action next session

- Learning mode: read `lesson_queue.md`, then execute `lesson_12_2h_runbook` and complete Level 1 -> Level 2 transition.
- Mentor self-study mode: expand quick-answer map to 130+ and playbook to F065; continue threshold-band automation.
- Upgrade mode: execute protocol Step 1 and open migration matrix.

## Bootstrap Hint for new AI

If user says "continue", follow `AGENTS.md` at repository root first.
