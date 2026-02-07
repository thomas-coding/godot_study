# Version Upgrade Protocol

目标：当用户说“更新知识库到 Godot X.Y”时，确保知识库可以稳定迁移而不丢历史。

## 0) 输入与输出

- Input: 目标版本（例如 `5.0`）。
- Output:
  1. `00_meta/version_registry.md` 已切换到目标版本并标记迁移状态。
  2. `02_mentor/indexes/version_matrix.md` 已回填兼容状态。
  3. 相关模块/卡片/问答条目已补齐版本字段。
  4. `03_sessions/handoff_latest.md` 有迁移进度与下一优先级。

## 1) 启动迁移（同一会话内先做）

1. 读取：
   - `00_meta/version_registry.md`
   - `02_mentor/indexes/version_matrix.md`
   - `02_mentor/knowledge_map.md`
2. 在 `version_registry.md` 更新：
   - `Engine` -> 目标版本
   - `Migration State` -> `in_migration`
   - `Last Updated` -> 当天日期
3. 在 `Version Timeline` 新增一行 `start migration` 记录。

## 2) 矩阵准备

1. 在 `version_matrix.md` 增加目标版本列（若不存在）。
2. 将所有条目在目标版本列初始化为 `not_started`。
3. 先按 P0 优先级排序：
   - M05 / M04 / M03 / M02 / M01
   - K001~K004
   - QA001~QA003

## 3) 条目迁移规则（逐项）

每个条目至少完成以下动作：

1. 复核来源（官方 docs / class reference / 源码路径）。
2. 更新条目头部字段：
   - `Version Scope`
   - `Last Verified`
   - `Compatibility`（unchanged/changed/deprecated/new）
3. 在 `version_matrix.md` 回填目标版本状态：
   - `verified` / `working` / `changed` / `deprecated`。
4. 若发现行为差异：
   - 条目正文新增“版本差异说明”。
   - 迁移结论写入 `02_mentor/docs_digest.md`。

## 4) 迁移收口

迁移结束时必须执行：

1. `version_registry.md`:
   - `Migration State` 从 `in_migration` 改为 `steady`（或 `blocked`）。
   - `Version Timeline` 新增 `finish migration` 行。
2. `handoff_latest.md` 追加：
   - 已完成条目
   - 未完成条目
   - 下一会话迁移优先级
3. `knowledge_map.md` 更新当前 Active Baseline。

## 5) 安全规则

- 不覆盖旧版本结论；旧内容保留并可追溯。
- 不把 `Hypothesis` 当作迁移完成依据。
- 如果缺证据，状态最多到 `working`，并加入 `learning_backlog.md`。

## 6) 状态字典（矩阵使用）

- `not_started`: 未迁移。
- `planned`: 已计划，未验证。
- `working`: 可用但证据不足。
- `verified`: 有充分证据。
- `changed`: 与旧版本行为存在差异。
- `deprecated`: 旧方案被弃用。
