# Mentor Knowledge Index

本目录是“我需要先学、再教、持续修正”的知识底座。

## 文件清单

- `knowledge_map.md`：导师知识全局地图（优先读）。
- `expert_study_protocol.md`：触发词“学习下godot”对应的学习执行协议。
- `docs_digest.md`：官方文档阅读摘要（按日期追加）。
- `godot_core_notes.md`：Godot 核心概念笔记（Scene/Node/Signal/...）。
- `game_dev_basics.md`：游戏开发基础方法论（循环、状态、反馈、调优）。
- `steam_release_basics.md`：Steam 发布相关基础知识与检查点。
- `learning_backlog.md`：导师待学习/待验证主题队列。
- `mentor_vision_and_self_study_plan.md`：导师愿景、能力目标与自学习计划。
- `mentor_progress_dashboard.md`：导师能力百分比与周目标进度看板。
- `feature_option_playbook.md`：常见 feature 多方案对比与取舍模板。
- `source_quick_answer_map_v1.md`：高频源码问题快速映射（类/函数链路/证据）。
- `performance_casebook_v1.md`：性能问题案例库（症状/指标/修复/验证）。
- `release_risk_matrix_v1.md`：发布风险矩阵（概率 x 影响 x 缓解）。
- `automated_regression_spec_v1.md`：自动化回归协议（指标/步骤/通过条件）。
- `release_rehearsal_samples_v1.md`：发布演练样本（风险闭环与流程记录）。
- `artifacts/`：真实构建回归证据（构建身份、指标快照、汇总 JSON）。
- `indexes/version_matrix.md`：导师知识版本兼容矩阵（按 Godot 版本追踪）。
- `00_meta/version_registry.md`：当前激活版本与迁移状态。
- `00_meta/version_upgrade_protocol.md`：版本升级执行协议。
- `graphics_foundations.md`：图形学基础学习主线（面向实作）。
- `engine_deep_dive_plan.md`：引擎深入理解路线（源码导向）。
- `indexes/`：模块/卡片/问答索引入口。
- `modules/`：模块化深度知识（主题级）。
- `cards/`：原子知识卡（可快速复用）。
- `qa/`：高频问题教学模板（可直接答题）。

## 证据等级

- `Verified`: 已有明确来源（官方 docs / class reference / 源码路径）。
- `Working`: 实操可用，但待补文档来源。
- `Hypothesis`: 推测，必须先验证再用于关键决策。

## 使用规则

- 教学中优先使用 `Verified` 内容。
- 若回答涉及 `Working/Hypothesis`，必须显式标注并给验证步骤。
- 若版本相关问题未在当前 baseline 验证，先查 `version_matrix.md` 再回答。
