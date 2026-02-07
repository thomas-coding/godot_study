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

1. 读 `03_sessions/handoff_latest.md`（最快恢复上下文）。
2. 读 `01_learner/current_state.md`（当前能力/短板/下一步）。
3. 读 `02_mentor/knowledge_map.md`（我方知识状态与优先级）。
4. 读 `00_plan/roadmap.md`（阶段目标不跑偏）。
5. 读 `00_meta/version_registry.md`（确认当前 Godot 基线版本）。
6. 按 `03_sessions/session_protocol.md` 执行当日教学。

## 每次结束必须更新

1. 当天日报：`01_learner/daily_reports/`
2. 学员快照：`01_learner/current_state.md`
3. 技能与短板：`01_learner/mastery_map.md`、`01_learner/gap_backlog.md`
4. 导师知识摘要：`02_mentor/docs_digest.md`
5. 会话交接：`03_sessions/handoff_latest.md`
6. 若版本变化：`00_meta/version_registry.md` + `02_mentor/indexes/version_matrix.md`

## 维护原则

- 关键知识点优先写来源（官方 docs URL、类名、源码路径）。
- 导师知识条目需标注适用版本（至少写当前 Active Baseline）。
- 先可运行，再扩展；每天要有最小可验证产出。
- 术语保留英文原名，解释可中文。
- 新会话默认读快照，不全量扫历史，避免上下文过载。
