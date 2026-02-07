# KB Architecture (Long-Term)

目标：支持几个月到几年的持续学习，不依赖单次会话记忆。

## 两大记忆域

## A. Learner Memory（学习者记忆）

回答三个问题：

1. 学过什么（Evidence）
2. 还缺什么（Gap）
3. 下一步做什么（Next Action）

主要文件：
- `01_learner/current_state.md`
- `01_learner/mastery_map.md`
- `01_learner/gap_backlog.md`
- `01_learner/daily_reports/*.md`

## B. Mentor Memory（导师记忆）

回答三个问题：

1. 我知道什么（Knowledge）
2. 证据级别如何（Verified / Working / Hypothesis）
3. 下一步该补哪块（Research Backlog）

主要文件：
- `02_mentor/knowledge_map.md`
- `02_mentor/docs_digest.md`
- `02_mentor/learning_backlog.md`
- `02_mentor/godot_core_notes.md` 等专题笔记
- `02_mentor/indexes/` + `modules/` + `cards/` + `qa/`

详细结构：`00_meta/mentor_knowledge_schema.md`

## 三层数据模型

- Raw：原始记录（日报、错误、命令、实验结果）
- Summary：周/月摘要（压缩历史，减少启动负担）
- Snapshot：当前快照（新会话优先读取）

原则：历史不丢失，但默认不全量读取。

## 版本维度（Engine Version Layer）

- Active Baseline：`00_meta/version_registry.md`
- 兼容矩阵：`02_mentor/indexes/version_matrix.md`
- 升级协议：`00_meta/version_upgrade_protocol.md`

规则：

1. 导师知识默认绑定 Active Baseline（例如 Godot 4.6）。
2. 用户触发“更新知识库到godot X.Y”后，先切换 baseline，再按矩阵逐项迁移。
3. 旧版本结论不删除，保留历史可追溯性。

## 会话恢复路径（新 AI）

1. `03_sessions/handoff_latest.md`
2. `01_learner/current_state.md`
3. `02_mentor/knowledge_map.md`
4. `00_plan/roadmap.md`
5. `00_meta/version_registry.md`

只在需要时下钻到 Raw 文件。

## 更新责任

每次会话结束至少更新：

1. 学习结果（日报 + 进度）
2. 学员快照（能力/短板/下一步）
3. 导师知识摘要（新增结论 + 来源）
4. 交接文件（下一会话开箱即用）
5. 若版本基线变更：更新版本登记与兼容矩阵
