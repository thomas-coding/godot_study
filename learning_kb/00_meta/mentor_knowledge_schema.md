# Mentor Knowledge Schema

目标：支持 1-3 年持续积累，同时保证“新 AI 在 5 分钟内进入可教学状态”。

## 分层结构

- `indexes/`：入口索引（先读）
- `modules/`：模块化深度笔记（主题级）
- `cards/`：原子知识卡（单结论、可引用）
- `qa/`：高频问答模板（教学即用）
- `docs_digest.md`：按日期追加的学习日志（证据总账）

## 命名规范

- 模块：`Mxx_topic.md`（如 `M01_mainloop_runtime_pipeline.md`）
- 卡片：`Kxxx_topic.md`（如 `K001_game_loop_order.md`）
- 问答：`QAxxx_topic.md`（如 `QA001_process_vs_physics_process.md`）

## 每条知识的最小字段

1. `Status`: Verified / Working / Hypothesis
2. `Conclusion`: 一句话可复述结论
3. `Evidence`: docs URL 或源码路径 + 函数名
4. `Teaching Use`: 这条知识在教学中怎么用
5. `Version Scope`: 适用 Godot 版本（如 `4.6`、`4.x`、`4.6~5.0`）
6. `Last Verified`: 最近验证日期（YYYY-MM-DD）

## 版本索引约束

- Active Baseline 由 `00_meta/version_registry.md` 管理。
- 模块/卡片/问答条目都应在 `02_mentor/indexes/version_matrix.md` 中有一行。
- 矩阵状态建议使用：`verified` / `working` / `planned` / `changed` / `deprecated` / `not_started`。

## 更新策略

- 学完模块后：
  - 更新 `modules/` 对应文件
  - 提炼 1-3 条 `cards/`
  - 补 1 条 `qa/`
  - 追加 `docs_digest.md`
- 若版本迁移进行中：
  - 先更新 `version_matrix.md` 对应条目的目标版本状态
  - 再更新模块正文中的 `Version Scope` 与 `Last Verified`
- 每周：更新 `indexes/`（状态与优先级）
