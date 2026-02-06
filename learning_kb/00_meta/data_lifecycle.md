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

## 证据与可信度

- `Verified`：有官方 docs / class reference / 源码依据。
- `Working`：实操可用但未补齐文档依据。
- `Hypothesis`：推测，不可直接当最终结论。

## 启动优化规则

- 新会话只读快照与索引，不扫描全量历史。
- 下钻顺序：handoff -> current_state -> mastery/gap -> raw report。
