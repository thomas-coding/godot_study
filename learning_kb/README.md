# Godot Learning KB

这是我们共同维护的长期知识库，用来解决两个核心问题：

1. 会话长期化后的上下文连续性（几个月后也能无缝接续）。
2. 教学质量可验证（关键结论可追溯到官方文档/源码/实作）。

## 核心设计（长期可继承）

- Learner Memory（你）：记录你学了什么、欠缺什么、下一步学什么。
- Mentor Memory（我）：记录我对 Godot/游戏开发/图形学的可复用知识。
- 三层记忆：Raw（原始记录） -> Summary（摘要压缩） -> Snapshot（当前快照）。
- 版本层：所有导师知识与 Godot 版本关联，支持升级迁移与兼容追踪。
- 导师知识存储规范见：`00_meta/mentor_knowledge_schema.md`。

## 目录说明

- `00_meta/`：知识库架构、命名规范、生命周期与归档策略。
- `00_plan/`：路线图与阶段目标。
- `01_learner/`：学习者状态、技能矩阵、短板清单、日报。
- `02_mentor/`：导师知识地图、文档摘要、研究待办。
- `03_sessions/`：会话协议与交接文件。
- `04_templates/`：固定模板（日报、提问、交接、知识条目）。

## 新会话快速恢复（Fast Boot）

1. 读 `.opencode/PROJECT_BRIEF.md`（长期规则/范围/Done Definition，通常由外部命令自动读取）。
2. 读 `.opencode/SESSION_STATE.md`（昨日结果与今日第一步，通常由外部命令自动读取）。
3. 读 `00_plan/lesson_queue.md`（课次进度 + 缓冲）。
4. 读 `00_meta/version_registry.md`（确认当前 Godot 基线版本）。
5. 按轨道补读：学员线 `01_learner/current_state.md`；导师线 `02_mentor/knowledge_map.md`。
6. 需要历史追溯时再读 `03_sessions/handoff_latest.md`。
7. 按 `03_sessions/session_protocol.md` 执行当日教学。

## 每次结束必须更新

1. 每日会话状态：`.opencode/SESSION_STATE.md`（必更，通常由外部命令执行）
2. 若长期规则变化：`.opencode/PROJECT_BRIEF.md`
3. 当天日报：`01_learner/daily_reports/`（学员线有进展时）
4. 学员快照：`01_learner/current_state.md`（学员线有进展时）
5. 技能与短板：`01_learner/mastery_map.md`、`01_learner/gap_backlog.md`（学员线有进展时）
6. 导师知识摘要：`02_mentor/docs_digest.md`（导师线有进展时）
7. 导师看板：`02_mentor/mentor_progress_dashboard.md`（导师线有进展时）
8. 课次队列：`00_plan/lesson_queue.md`（状态变化时）
9. 长历史交接：`03_sessions/handoff_latest.md`（需要保留长历史时）
10. 若版本变化：`00_meta/version_registry.md` + `02_mentor/indexes/version_matrix.md`

## 维护原则

- 关键知识点优先写来源（官方 docs URL、类名、源码路径）。
- 导师知识条目需标注适用版本（至少写当前 Active Baseline）。
- 用户触发“你自己学习”时，按 `02_mentor/mentor_vision_and_self_study_plan.md` 执行导师自学习循环。
- 每次导师学习后更新 `02_mentor/mentor_progress_dashboard.md`（百分比 + 周目标）。
- 先可运行，再扩展；每天要有最小可验证产出。
- 术语保留英文原名，解释可中文。
- 新会话默认读快照，不全量扫历史，避免上下文过载。
