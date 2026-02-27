# Session Protocol (Lesson-Based)

## Start Checklist (5 min)

1. 读取 `.opencode/PROJECT_BRIEF.md`（通常由外部命令自动读取，AI 无需重复执行）
2. 读取 `.opencode/SESSION_STATE.md`（通常由外部命令自动读取，AI 无需重复执行）
3. 读取 `learning_kb/00_plan/lesson_queue.md`
4. 读取 `learning_kb/00_meta/dual_track_governance.md`
5. 读取 `learning_kb/00_meta/version_registry.md`
6. 按轨道补读：学员线读 `learning_kb/01_learner/current_state.md`；导师线读 `learning_kb/02_mentor/knowledge_map.md`
7. 需要历史追溯时再读 `learning_kb/03_sessions/handoff_latest.md`
8. 确定今日唯一目标（一句英文）

## 双轨判定规则（强制）

- 学员线触发词：`我开始学习`、`继续今天学习`、`继续学`、`学下一课`、`第X课`、`上课`、`我学`、`学员线`。
- 导师线触发词：`学习下godot`、`你自己学习`、`你先学习`、`你备下课`、`备课`、`导师线`。
- 语义不清时默认学员线。
- 若会话中切轨，必须明确告知“已切换到学员线/导师线”。

## 学员会话（固定课堂SOP）

1. 回顾（3-5 分钟）：复盘上节结果与未解决问题。
2. 目标（1 句话）：必须可验收。
3. Runbook 执行：先读 `00_plan/lesson_queue.md`，再按对应 lesson runbook 推进，不跳步。
4. 验收：给出通过/失败标准并现场检查。
5. 修复：只做最小修复，避免超范围扩展。
6. 结课播报：验收通过后先明确告知“本课完成”，并等待学员安排（答疑/文档/切导师线）。
7. 收尾（仅导师线）：用户明确切到导师线后，再执行耗时收尾（日报/状态/SESSION_STATE/备课/学习）。

执行备注：每节课流程必须一致，避免临时随机改课。
执行备注：学员线进行中不做导师备课与导师知识库扩写，避免学员等待。
执行备注：学员线结课后若用户未明确切导师线，保持在学员线处理答疑或轻量交付。

## 学员线指令发布协议（系统级，所有主题适用）

- 每次仅发布一个“原子步骤卡”，字段必须完整：
  - `步骤名`
  - `目标`
  - `前提`
  - `动作（对象/路径/命令/参数）`
  - `验收（可观测通过标准）`
  - `失败分叉（A/B）`
  - `最小回退`
- 按任务类型追加必填字段：
  - UI/编辑器：`节点名 + 精确类型 + 父路径 + 关键属性 + 常见误选`。
  - 代码改动：`文件路径 + 符号定位 + 变更内容 + 预期行为/日志`。
  - 调试排障：`假设 + 观测点 + 判定分支 + 下一动作`。
  - 测试验证：`执行入口/命令 + 通过标准 + 回归范围`。
  - Git 操作：`暂存边界 + 提交意图 + 安全限制`。

原子步骤卡模板（统一使用）：

```text
步骤名：
目标：
前提：
动作（对象/路径/命令/参数）：
验收（可观测通过标准）：
失败分叉（A/B）：
最小回退：
```

## 学员线发课前门禁（5项全通过）

- `完整性`：无缺字段，无隐含前提。
- `单义性`：不存在多种理解或多种执行路径。
- `可执行性`：零经验学员可直接操作。
- `可验证性`：有明确通过/失败观测点。
- `可恢复性`：失败时可最小代价回退。

## 学员线执行循环（强制）

- 固定循环：`发一步 -> 学员回执 -> 校验 -> 再发下一步`。
- 禁止一次投放多步半规格化指令。
- 若回执失败，先进入该步分叉与回退，不跨步推进。

## 学员线 Execution Blocks (2h, standard)

- Block A (25 min): 英文文档输入（先自己理解，不先问 AI）
- Block B (20 min): 向 AI 发起聚焦问题（可中文提问 + 指定英文回答）
- Block C (50 min): 动手实现与调试
- Block D (20 min): 总结与术语卡片沉淀

执行备注：课次与自然日解耦。一天可以学习多课，也可以不学习。

## 导师学习会话（触发词：学习下godot / 你自己学习 / 你先学习 / 你备下课 / 备课）

- 先输出：本次学习计划（1-2 模块 + 产出文件）
- 必做：先输出“学员线下一节课计划”（目标 + 步骤 + 验收点）
- 必做：检查并补齐“至少提前 3 课”的 lesson runbook 缓冲
- 再执行：官方 docs + 源码定位学习
- 参考导师目标与学习路线：
  - `02_mentor/mentor_vision_and_self_study_plan.md`
  - `02_mentor/mentor_progress_dashboard.md`
- 最后写回：
  - `02_mentor/modules/`
  - `02_mentor/cards/`
  - `02_mentor/qa/`
  - `02_mentor/docs_digest.md`
  - `02_mentor/mentor_progress_dashboard.md`
  - `.opencode/SESSION_STATE.md`（通常由外部命令写入）
  - `03_sessions/handoff_latest.md`（需要保留长历史时）

## 版本迁移会话（触发词：更新知识库到godot X.Y）

- 先读取：
  - `00_meta/version_registry.md`
  - `00_meta/version_upgrade_protocol.md`
  - `02_mentor/indexes/version_matrix.md`
- 再执行：
  - 切换 `version_registry.md` 的 Active Baseline
  - 将 `Migration State` 设为 `in_migration`
  - 按矩阵逐项回填模块/卡片/问答兼容状态
- 最后写回：
  - `00_meta/version_registry.md`
  - `02_mentor/indexes/version_matrix.md`
  - `02_mentor/docs_digest.md`
  - `.opencode/SESSION_STATE.md`（通常由外部命令写入）
  - `03_sessions/handoff_latest.md`（需要保留长历史时）

## End Deliverables

- `.opencode/SESSION_STATE.md` 更新（每日必做，通常由外部命令执行）
- `.opencode/PROJECT_BRIEF.md` 更新（仅长期规则/范围变化时）
- 可运行结果（最小功能）
- 英文总结 5-8 行
- 术语卡 1-3 条（1h 模式至少 1 条）
- 日报写入 `01_learner/daily_reports/`
- `01_learner/current_state.md` 更新
- `01_learner/mastery_map.md` / `gap_backlog.md` 更新
- `02_mentor/docs_digest.md` 更新（新增来源或结论）
- `02_mentor/mentor_progress_dashboard.md` 更新（导师能力百分比）
- `03_sessions/handoff_latest.md` 更新（需要保留长历史时）
- `00_plan/lesson_queue.md` 更新
- 若版本迁移发生：`00_meta/version_registry.md` + `02_mentor/indexes/version_matrix.md`

## 切轨保护

- 若学员线未明确结束（例如未说“今天结束/先到这里/下课”），不得中途切导师线备课。
- 仅当用户明确触发导师线（如“你学习下/你备下课”）时，才执行备课与导师资产更新。
