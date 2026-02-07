# Daily Session Protocol

## Start Checklist (5 min)

1. 读取 `learning_kb/03_sessions/handoff_latest.md`
2. 读取 `learning_kb/01_learner/current_state.md`
3. 读取 `learning_kb/02_mentor/knowledge_map.md`
4. 读取 `learning_kb/00_plan/roadmap.md`
5. 读取 `learning_kb/00_meta/version_registry.md`
6. 确定今日唯一目标（一句英文）

## Execution Blocks (1h)

- Block A (12 min): 英文文档输入（先自己理解，不先问 AI）
- Block B (8 min): 向 AI 发起聚焦问题（可中文提问 + 指定英文回答）
- Block C (30 min): 动手实现与调试
- Block D (5 min): 总结与术语卡片沉淀

## Execution Blocks (2h, optional)

- Block A (25 min): 英文文档输入（先自己理解，不先问 AI）
- Block B (20 min): 向 AI 发起聚焦问题（可中文提问 + 指定英文回答）
- Block C (50 min): 动手实现与调试
- Block D (20 min): 总结与术语卡片沉淀

## 导师学习会话（触发词：学习下godot / 你自己学习 / 你先学习）

- 先输出：本次学习计划（1-2 模块 + 产出文件）
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
  - `03_sessions/handoff_latest.md`

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
  - `03_sessions/handoff_latest.md`

## End Deliverables

- 可运行结果（最小功能）
- 英文总结 5-8 行
- 术语卡 1-3 条（1h 模式至少 1 条）
- 日报写入 `01_learner/daily_reports/`
- `01_learner/current_state.md` 更新
- `01_learner/mastery_map.md` / `gap_backlog.md` 更新
- `02_mentor/docs_digest.md` 更新（新增来源或结论）
- `02_mentor/mentor_progress_dashboard.md` 更新（导师能力百分比）
- `03_sessions/handoff_latest.md` 更新
- 若版本迁移发生：`00_meta/version_registry.md` + `02_mentor/indexes/version_matrix.md`
