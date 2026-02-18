# Progress Log

> 规则：每次学习结束追加一条，不覆盖历史。

## 2026-02-06

- Status: 初始化学习系统（知识库目录 + 长期教学协议）。
- Done:
  - 确认目标：Godot 从零到 Steam 上架。
  - 确认教学形式：中文提问可切换英文回答 + 术语说明。
  - 建立本地 `learning_kb` 作为长期记忆载体。
- Blockers:
  - 尚未安装 Godot 编辑器。
  - 尚未开始 Day 1 实操。
- Next:
  - 执行 Day 1：安装与最小 2D 原型。

## 2026-02-06 (update)

- Status: 按 1h/天节奏重排首周计划并补充可执行 runbook。
- Done:
  - 将学习协议从默认 2h 扩展为 1h + 2h 可选模式。
  - 更新 Week 01 与 Day 01 目标为 1h 友好版本。
  - 新增 `00_plan/day_01_1h_runbook.md`（60 分钟逐步操作清单）。
  - 补充官方文档要点到 `02_mentor/docs_digest.md`（含来源链接）。
- Blockers:
  - 仍未安装 Godot 编辑器。
- Next:
  - 按 `00_plan/day_01_1h_runbook.md` 执行今天任务并记录结果。

## 2026-02-06 (update-2)

- Status: 确认今天 1h 为临时安排，后续恢复 2h。
- Done:
  - `profile.md` 已恢复默认 2h/天，并记录今天 1h 例外。
  - `week_01_bootstrap.md` 已恢复 2h 默认计划，并注明当天临时 runbook。
- Next:
  - 完成 Day 1 的场景创建与保存，然后执行 Input Map。

## 2026-02-06 (day1 completed)

- Status: Day 1 完成（今日按 1h 临时节奏执行）。
- Done:
  - Godot 可正常启动。
  - `first_game` 可通过 `F5` 运行。
  - Input Map 已创建：`move_left` / `move_right` / `jump`。
  - 已附加调试脚本并验证 `jump` 触发成功（输出 `jump OK`）。
- Blockers:
  - 无。
- New Terms:
  - `main scene`
  - `Input Map`
  - `is_action_just_pressed`
- Next:
  - Day 2（恢复 2h）：创建 `Player`（`CharacterBody2D`）并完成最小移动/跳跃。

## 2026-02-06 (learner report)

- Date: 2026-02-06
- Status: Completed
- Done:
  1. Installed Godot 4.6.
  2. Created a new project and added Input Map; mapped `jump` to `Space`.
  3. Created a GDScript file, attached it to `Main`, and handled the `jump` action.
  4. Ran the project and verified `jump` logic works.
- Blockers: None
- New Terms:
  - `scenes`
  - `nodes`
- Next:
  - Build a `Player` with `CharacterBody2D` and complete minimal movement + jump in Day 2.
  - Daily report saved: `01_learner/daily_reports/2026-02-06.md`.

## 2026-02-06 (kb architecture upgrade)

- Status: 完成长期可继承知识库升级（面向月/年级别持续学习）。
- Done:
  - 新增 `00_meta/`（架构、生命周期、命名与索引规范）。
  - 新增学习者快照与能力系统：
    - `01_learner/current_state.md`
    - `01_learner/mastery_map.md`
    - `01_learner/gap_backlog.md`
    - `01_learner/daily_reports/index.md`
  - 新增导师知识系统：
    - `02_mentor/knowledge_map.md`
    - `02_mentor/learning_backlog.md`
  - 新增会话交接系统：
    - `03_sessions/handoff_latest.md`
    - `03_sessions/handoff_history/2026-02-06.md`
  - 更新 `README.md` 与 `session_protocol.md` 为快照优先恢复流程。
- Blockers:
  - 无。
- Next:
  - Day 2（2h）：`CharacterBody2D` 最小移动/跳跃实现。

## 2026-02-06 (agent bootstrap hardening)

- Status: 新会话自动接续机制已加固。
- Done:
  - 新增仓库根 `AGENTS.md`，定义“继续任务”时的必读顺序与更新要求。
  - 新增仓库根 `README.md`，提供 Quick Start 恢复路径。
  - 更新 `03_sessions/handoff_latest.md`，增加 bootstrap 提示。
- Next:
  - 明日按 Day 2（2h）执行 `CharacterBody2D` 移动/跳跃。

## 2026-02-06 (github sync rule added)

- Status: 已固化 GitHub 推送约定，后续可直接说“更新到 github”。
- Done:
  - `AGENTS.md` 增加 GitHub 同步约定（origin/master）。
  - `README.md` 增加默认同步说明。
- Next:
  - 明日继续 Day 2（2h）任务。

## 2026-02-06 (expert mentor architecture)

- Status: 已建立“学习下godot”长期导师学习架构。
- Done:
  - `AGENTS.md` 增加触发词流程（学习下godot -> 列计划 -> 学习 -> 回写）。
  - 新增导师知识模式协议：`02_mentor/expert_study_protocol.md`。
  - 新增可扩展知识结构：`indexes/ modules/ cards/ qa/`。
  - 首批源码级模块笔记已落地（M01~M05）与首批知识卡/问答模板（K001~K004, QA001~QA003）。
  - `handoff_latest.md` 增加“学习下godot”启动提示。
- Next:
  - 明日优先 Day 2（2h）实作；若触发“学习下godot”，先进入导师学习模式输出模块计划。

## 2026-02-07 (versioned kb architecture)

- Status: 已完成知识库版本治理架构，支持未来 Godot 5.0+ 迁移。
- Done:
  - 新增 `00_meta/version_registry.md`（Active Baseline + 迁移状态 + 时间线）。
  - 新增 `00_meta/version_upgrade_protocol.md`（触发迁移的标准操作流程）。
  - 新增 `02_mentor/indexes/version_matrix.md`（模块/卡片/问答版本兼容矩阵）。
  - 现有 M01~M05、K001~K004、QA001~QA003 已补齐版本字段。
  - `AGENTS.md` / `README.md` / `session_protocol.md` 已接入版本迁移触发词。
- Blockers:
  - 无。
- Next:
  - 继续 Day 2 实作；如用户触发升级到 Godot X.Y，按 protocol 执行迁移并回填矩阵。

## 2026-02-07 (mentor mission sync)

- Status: 已对齐导师长期愿景与自学习计划。
- Done:
  - 新增 `02_mentor/mentor_vision_and_self_study_plan.md`（愿景/能力目标/SLA/12周学习路线）。
  - 触发词扩展到 `你自己学习/你先学习`，并接入 `AGENTS.md` 与 `session_protocol.md`。
  - 明确默认答题规范：feature 问题多方案对比；源码问题给函数链路与证据。
- Blockers:
  - 无。
- Next:
  - 继续按 Day 2 主线实作；若触发“你自己学习”，按导师自学习循环执行。

## 2026-02-07 (mentor progress dashboard)

- Status: 导师能力百分比看板已上线，可持续量化追踪。
- Done:
  - 新增 `02_mentor/mentor_progress_dashboard.md`（5 维度 + 12 周目标 + 自动更新规则）。
  - 当前导师总体进度基线设为 `22%`。
  - 启动与会话协议已接入看板更新要求。
- Blockers:
  - 无。
- Next:
  - 每次“你自己学习”后按规则刷新分数与周目标进度。

## 2026-02-07 (mentor self-study cycle #1)

- Status: 已执行一次“你自己学习”完整循环（基于 Godot 4.6）。
- Done:
  - M05 补齐 Day2 教学清单与常见坑。
  - QA 从 QA003 扩展到 QA007（新增 QA004~QA007）。
  - 新增卡片 K005~K007（删除队列时序、delta 来源、velocity 单位坑）。
  - 新增 `feature_option_playbook.md` 与 Day2 排错模板。
  - 导师能力看板从 22% 更新到 25%。
- Blockers:
  - 无。
- Next:
  - 自学习继续冲刺 QA008~QA010，并建立 source quick-answer map v1。

## 2026-02-07 (mentor self-study cycle #2)

- Status: 已完成第二次“你自己学习”循环（Godot 4.6）。
- Done:
  - 完成 M06：`Camera2D` 跟随与抖动诊断模块。
  - QA 扩展到 QA010（新增 QA008~QA010）。
  - 卡片扩展到 K010（新增 K008~K010）。
  - 新增 `source_quick_answer_map_v1.md`（10 个高频源码问题映射）。
  - playbook 扩展到 F005，新增 Camera/Node 生命周期/删除策略方案对比。
  - 导师能力看板从 25% 更新到 30%。
- Blockers:
  - 无。
- Next:
  - 继续扩展 quick-answer map 到 20+，playbook 到 F010，并补 D4/D5（性能/发布）资产。

## 2026-02-07 (mentor self-study cycle #3)

- Status: 已完成第三次“你自己学习”循环（Godot 4.6）。
- Done:
  - 完成 M07：资源加载与场景实例化（ResourceLoader/PackedScene）。
  - 完成 M08：性能监视与帧预算基础（Performance/Engine/Time）。
  - QA 扩展到 QA015（新增 QA011~QA015）。
  - 卡片扩展到 K016（新增 K011~K016）。
  - `source_quick_answer_map_v1.md` 从 10 扩展到 20 个高频问题。
  - `feature_option_playbook.md` 从 F005 扩展到 F010。
  - 新增 D4/D5 资产：性能排查清单、导出运行时加载清单。
  - 导师能力看板从 30% 更新到 36%。
- Blockers:
  - 无。
- Next:
  - 继续扩展 quick-answer map 到 30+，playbook 到 F015，并补性能案例库与发布回归清单。

## 2026-02-07 (mentor self-study cycle #4)

- Status: 已完成第四次“你自己学习”循环（Godot 4.6）。
- Done:
  - QA 扩展到 QA020（新增 QA016~QA020）。
  - 卡片扩展到 K021（新增 K017~K021）。
  - `source_quick_answer_map_v1.md` 从 20 扩展到 30 个高频问题。
  - `feature_option_playbook.md` 从 F010 扩展到 F015。
  - 新增 `performance_casebook_v1.md`（3 个性能案例）。
  - 新增 `windows_release_preflight_checklist.md`（发布前回归清单）。
  - 导师能力看板从 36% 更新到 42%。
- Blockers:
  - 无。
- Next:
  - 继续扩展 quick-answer map 到 40+，playbook 到 F020，补自动化回归规范与发布风险矩阵。

## 2026-02-07 (mentor self-study cycle #5)

- Status: 已完成第五次“你自己学习”循环（Godot 4.6）。
- Done:
  - QA 扩展到 QA025（新增 QA021~QA025）。
  - 卡片扩展到 K026（新增 K022~K026）。
  - `source_quick_answer_map_v1.md` 从 30 扩展到 40 个高频问题。
  - `feature_option_playbook.md` 从 F015 扩展到 F020。
  - 新增 `release_risk_matrix_v1.md` 与 `automated_regression_spec_v1.md`。
  - 导师能力看板从 42% 更新到 48%。
- Blockers:
  - 无。
- Next:
  - 继续扩展 quick-answer map 到 50+，playbook 到 F025，并补发布实战样本。

## 2026-02-07 (mentor self-study cycle #6)

- Status: 已完成第六次“你自己学习”循环（Godot 4.6）。
- Done:
  - QA 扩展到 QA030（新增 QA026~QA030）。
  - 卡片扩展到 K031（新增 K027~K031）。
  - `source_quick_answer_map_v1.md` 从 40 扩展到 50 个高频问题。
  - `feature_option_playbook.md` 从 F020 扩展到 F025。
  - 新增 `release_rehearsal_samples_v1.md`，并与风险矩阵建立回链。
  - 导师能力看板从 48% 更新到 52%。
- Blockers:
  - 无。
- Next:
  - 继续扩展 quick-answer map 到 60+，playbook 到 F030，并补真实构建回归样本。

## 2026-02-07 (mentor self-study cycle #7)

- Status: 已完成第七次“你自己学习”循环（Godot 4.6）。
- Done:
  - 完成 M09：`SceneTree` 组调用编排 + 场景持久化 owner 边界 + JSON 诊断 + Viewport 运行时画质控制。
  - QA 扩展到 QA035（新增 QA031~QA035）。
  - 卡片扩展到 K036（新增 K032~K036）。
  - `source_quick_answer_map_v1.md` 从 50 扩展到 60 个高频问题。
  - `feature_option_playbook.md` 从 F025 扩展到 F030。
  - 导师能力看板从 52% 更新到 56%。
- Blockers:
  - 无。
- Next:
  - 继续扩展 quick-answer map 到 70+，playbook 到 F035，并补真实构建回归样本（含指标快照）。

## 2026-02-07 (mentor self-study cycle #8)

- Status: 已完成第八次“你自己学习”循环（Godot 4.6）。
- Done:
  - 完成 M10：场景切换两阶段时序、`create_timer` 更新顺序、JSON 资源 editor/runtime 分支与保存语义。
  - QA 扩展到 QA040（新增 QA036~QA040）。
  - 卡片扩展到 K041（新增 K037~K041）。
  - `source_quick_answer_map_v1.md` 从 60 扩展到 70 个高频问题。
  - `feature_option_playbook.md` 从 F030 扩展到 F035。
  - `release_rehearsal_samples_v1.md` 升级为真实构建记录（RRB-001~RRB-003）并新增 artifacts 汇总。
  - 导师能力看板从 56% 更新到 60%。
- Blockers:
  - `--benchmark-file` 在当前环境与较长 `--quit-after` 组合存在不稳定现象，已改用 stdout 解析作为备份路径。
- Next:
  - 继续扩展 quick-answer map 到 80+，playbook 到 F040，并把真实构建样本累计到 5 次建立阈值带。

## 2026-02-08 (mentor self-study cycle #9)

- Status: 已完成第九次“你自己学习”循环（Godot 4.6）。
- Done:
  - 完成 M11：Signal 派发语义、GUI 输入传播与 pause-aware processing。
  - QA 扩展到 QA045（新增 QA041~QA045）。
  - 卡片扩展到 K046（新增 K042~K046）。
  - `source_quick_answer_map_v1.md` 从 70 扩展到 80 个高频问题。
  - `feature_option_playbook.md` 从 F035 扩展到 F040。
  - 真实构建样本从 3 条扩展到 5 条（新增 RRB-004/005），并建立 `rrb_threshold_band_v1.json` 阈值带。
  - 导师能力看板从 60% 更新到 66%。
- Blockers:
  - `--benchmark-file` 在当前环境下仍存在不稳定；已持续使用 `--benchmark` stdout 解析链路。
- Next:
  - 继续扩展 quick-answer map 到 90+，playbook 到 F045，并把阈值带接入自动化 pass/fail 判定。

## 2026-02-18 (dual-track governance lock)

- Status: 已固化长期双轨治理规则。
- Done:
  - 新增 `00_meta/dual_track_governance.md`，明确学员线/导师线触发词、优先级、切换规则。
  - `AGENTS.md` 写入固定课堂SOP与导师线“必须先给学员下节计划”的约束。
  - `03_sessions/session_protocol.md` 增加双轨判定与学员课堂固定流程。
  - `week_01_bootstrap.md` 对齐 Day2 runbook 课程定义。
- Blockers:
  - 无。
- Next:
  - 按 Day2 runbook 开始学员实作：`CharacterBody2D` 左右移动 + 跳跃。

## Entry Template

- Date:
- Status:
- Done:
- Blockers:
- New Terms:
- Next:
