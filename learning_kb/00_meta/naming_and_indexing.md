# Naming and Indexing Conventions

## 文件命名

- 统一小写 + 下划线（已有历史文件可渐进兼容）。
- 日期文件用 `YYYY-MM-DD`。
- 启动双文件固定名：`.opencode/PROJECT_BRIEF.md`、`.opencode/SESSION_STATE.md`。
- 长历史交接文件固定名：`handoff_latest.md`（按需追加）。

## 索引优先

为高频目录提供索引文件：

- `01_learner/daily_reports/index.md`
- `02_mentor/knowledge_map.md`
- `02_mentor/indexes/version_matrix.md`

索引里只放：

- 条目标题
- 日期
- 状态（done/in_progress/planned）
- 跳转路径

## 引用规范

- 引用知识点时尽量带来源 URL。
- 引用实作结果时带日志路径。
- 引用代码时带文件路径与关键节点名。

## 版本标记规范

- 版本号格式统一为 `major.minor`（如 `4.6`, `5.0`）。
- 范围写法使用 `~`（如 `4.6~5.0`）。
- 兼容状态统一使用：`not_started/planned/working/verified/changed/deprecated`。
