# AGENT BOOTSTRAP (Must Read First)

如果你是新会话的 AI，并且用户说“继续今天学习/继续任务”，请先执行下面步骤，再回复用户。

## 1) 必读文件（按顺序）

1. `learning_kb/03_sessions/handoff_latest.md`
2. `learning_kb/01_learner/current_state.md`
3. `learning_kb/02_mentor/knowledge_map.md`
4. `learning_kb/00_plan/roadmap.md`
5. `learning_kb/00_meta/dual_track_governance.md`
6. `learning_kb/00_meta/version_registry.md`
7. `learning_kb/03_sessions/session_protocol.md`

## 1b) 触发词扩展（轨道判定）

- 若用户说“我开始学习/day2 课程/上课/我学/学员线”，把它视为“学员会话”：
  1. 读对应 runbook（例如 `learning_kb/00_plan/day_02_2h_runbook.md`）
  2. 按固定课堂SOP执行（回顾 -> 目标 -> runbook -> 验收 -> 修复 -> 收尾）
  3. 不跳步，不临时改流程

- 若用户说“学习下godot/学习 Godot/研究 Godot/先学习再教/你自己学习/你先学习”，把它视为“导师学习会话”，按以下流程执行：
  1. 读 `learning_kb/02_mentor/knowledge_map.md`
  2. 读 `learning_kb/02_mentor/learning_backlog.md`
  3. 读 `learning_kb/02_mentor/mentor_vision_and_self_study_plan.md`
  4. 读 `learning_kb/02_mentor/mentor_progress_dashboard.md`
  5. 基于当前阶段（`learning_kb/00_plan/roadmap.md`）列出本次学习计划（模块 + 产出文件）
  6. 先输出“学员线下一节课计划”（目标 + 步骤 + 验收点）
  7. 学习（官方 docs + 源码定位），把结论写入 `learning_kb/02_mentor/` 并标注证据等级
  8. 更新 `learning_kb/02_mentor/mentor_progress_dashboard.md`（刷新百分比与周目标进度）
  9. 更新 `learning_kb/03_sessions/handoff_latest.md`（记录已补齐哪些知识点、下次优先级）

## 1c) 默认优先级与切换规则

- 若用户意图有歧义，默认走学员线。
- 会话中切换轨道时，必须明确说明“已切换到学员线/导师线”。
- 禁止把学员线与导师线流程混成一套随机流程。

## 1d) 版本升级触发词

- 若用户说“更新知识库到godot X.Y / 升级知识库到 X.Y / 切换到 Godot X.Y”，按以下流程执行：
  1. 读 `learning_kb/00_meta/version_registry.md`
  2. 读 `learning_kb/00_meta/version_upgrade_protocol.md`
  3. 读 `learning_kb/02_mentor/indexes/version_matrix.md`
  4. 将 `version_registry.md` 的 Active Baseline 更新为目标版本，并标记迁移状态
  5. 按协议逐项回填 `version_matrix.md` 与导师知识条目的版本适配状态
  6. 更新 `learning_kb/03_sessions/handoff_latest.md` 记录迁移进度与下一优先级

## 2) 启动规则

- 不要先问泛问题，先基于以上文件给出“今日计划 + 第一步动作”。
- 以最小可运行结果为优先。
- 若用户说“用英文回答”，使用英文主答并附术语说明（固定表达/专业术语 + 中文解释）。

## 3) 会话结束时必须更新

1. `learning_kb/01_learner/daily_reports/YYYY-MM-DD.md`
2. `learning_kb/01_learner/current_state.md`
3. `learning_kb/01_learner/mastery_map.md` / `learning_kb/01_learner/gap_backlog.md`
4. `learning_kb/02_mentor/docs_digest.md`
5. `learning_kb/03_sessions/handoff_latest.md`
6. `learning_kb/02_mentor/mentor_progress_dashboard.md`
7. 若版本基线发生变化，额外更新：
   - `learning_kb/00_meta/version_registry.md`
   - `learning_kb/02_mentor/indexes/version_matrix.md`

## 4) 项目范围约束

- 代码项目主目录：`projects/`
- 学习知识库主目录：`learning_kb/`
- 引擎源码目录 `godot/` 默认不改动（除非用户明确要求）。

## 5) GitHub 同步约定

- 远程仓库：`origin = https://github.com/thomas-coding/godot_study`
- 默认分支：`master`
- 当用户说“更新到 github / 提交并上传”时：
  1. 提交本次学习相关变更（排除 `godot/` 与临时文件）
  2. 推送到 `origin/master`
- 未经用户明确要求，不主动 push。
