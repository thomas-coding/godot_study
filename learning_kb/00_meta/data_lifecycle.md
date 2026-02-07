# Data Lifecycle and Archive Policy

## 命名与分片

- 日报按日期命名：`YYYY-MM-DD.md`
- 周报按周命名：`YYYY-Www.md`
- 大文件按月份分片，避免单文件无限膨胀。

## 读写策略

- Append-only：历史记录尽量追加，不覆盖。
- Snapshot overwrite：`current_state.md`、`handoff_latest.md` 可覆盖更新。
- 关键变更写入 `progress_log.md` 形成可追溯链。

## 归档策略（规模变大后）

- 超过 90 天的 Raw 日报可移入 `01_learner/archive/YYYY/`。
- 每月产出一个月摘要（保留核心结论、能力变化、待办）。
- 归档后保持索引链接不断裂。
- 导师知识按“模块长期有效 + 证据可追溯”管理：
  - `modules/` 不归档，只追加版本适配状态。
  - `cards/` 和 `qa/` 可长期增量追加。
  - `docs_digest.md` 每季度滚动：历史转存到 `02_mentor/archive/docs_digest_YYYYQn.md`。

## 版本迁移与冻结策略

- Active Baseline 记录在 `00_meta/version_registry.md`。
- 版本迁移由 `00_meta/version_upgrade_protocol.md` 驱动。
- 兼容状态统一回填到 `02_mentor/indexes/version_matrix.md`。
- 当升级到新版本时：
  1. 旧版本知识不删除，只标记 `legacy` / `deprecated` / `changed`。
  2. 新版本迁移过程可持续多天，状态写 `in_migration`。
  3. 迁移完成后将旧版本状态冻结为只读历史（可补注释，不改原结论）。

## 证据与可信度

- `Verified`：有官方 docs / class reference / 源码依据。
- `Working`：实操可用但未补齐文档依据。
- `Hypothesis`：推测，不可直接当最终结论。

## 启动优化规则

- 新会话只读快照与索引，不扫描全量历史。
- 下钻顺序：handoff -> current_state -> version_registry -> mastery/gap -> raw report。
- 导师侧下钻顺序：knowledge_map -> indexes -> modules/cards/qa -> docs_digest archive。
