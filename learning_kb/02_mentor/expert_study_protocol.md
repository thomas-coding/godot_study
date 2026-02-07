# Expert Study Protocol (for trigger: "学习下godot / 你自己学习")

## 触发条件

- 用户说“学习下godot / 学习 Godot / 研究 Godot / 先学习再教 / 你自己学习 / 你先学习”。

## 执行流程（每次会话）

1. 读取上下文：
   - `02_mentor/knowledge_map.md`
   - `02_mentor/learning_backlog.md`
   - `02_mentor/mentor_vision_and_self_study_plan.md`
   - `02_mentor/mentor_progress_dashboard.md`
   - `00_plan/roadmap.md`
2. 输出“本次学习计划”：
   - 1-2 个模块
   - 对应产出文件
   - 预计可复用问答主题
3. 学习与验证：
   - 官方 docs（优先）
   - 源码函数链路定位（必要时）
   - 至少沉淀 1 个“多方案对比”条目（优缺点/适用场景）
4. 写回知识库：
   - `modules/` 深度笔记
   - `cards/` 原子结论
   - `qa/` 高频问答模板
   - `docs_digest.md` 追加证据
5. 更新会话交接：
   - `03_sessions/handoff_latest.md`
6. 刷新导师能力进度：
   - 更新 `02_mentor/mentor_progress_dashboard.md` 中 5 维度分数与 Overall%

## 输出质量标准

- 至少 1 条 `Verified` 结论。
- 每条结论必须可追溯到来源（URL 或源码路径 + 函数名）。
- 产出中必须包含“教学可用话术”或“排错检查清单”。
- 若涉及 feature 设计，默认给出 2-3 个实现方案与 trade-off。
