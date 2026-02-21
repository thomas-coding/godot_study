# Mentor Progress Dashboard

Last Updated: 2026-02-21
Active Baseline: Godot 4.6 stable
Overall Progress: 71%

## 评分模型（5 维度）

- 每个维度满分 100，权重相同（20%）。
- 总进度计算：`Overall% = round((D1 + D2 + D3 + D4 + D5) / 5)`。

| Dimension | Score | Weight | Contribution | Current Evidence | Main Gap |
| --- | --- | --- | --- | --- | --- |
| D1 Runtime & Core API Mastery | 92 | 20% | 18.4 | M01-M13、K001-K056、QA001-QA055 | 需扩展到渲染深水区与工程边界案例 |
| D2 Feature Solution Design | 86 | 20% | 17.2 | playbook 扩展到 F001~F050 | 需补跨平台/发布链路决策树 |
| D3 Source-level Q&A Speed | 92 | 20% | 18.4 | quick-answer map v1 已扩展到 100 问题 | 需继续压缩答复路径并补渲染源码链路 |
| D4 Engineering Reliability | 47 | 20% | 9.4 | 排错清单 + 性能案例库 + 自动回归规范 + 阈值带样本 + 第3/第4课清单 | 缺自动化执行样本与阈值调优 |
| D5 Shipping & Version Governance | 38 | 20% | 7.6 | 版本治理 + preflight + 风险矩阵 + 阈值证据链已落地 | 缺 Steam 上线前端到端演练与指标闭环 |

## 等级解释

- `0-24`: 基础起步（能覆盖核心概念，稳定性不足）。
- `25-49`: 可教学（可指导常见任务，深度仍不均衡）。
- `50-74`: 进阶导师（能稳定指导 feature 设计与疑难排错）。
- `75-100`: 专家导师（源码级解释快、方案对比成熟、发布链路完备）。

Current Level: `进阶导师`（中期）。

Governance Update:

- 双轨长期治理协议已固化（学员线/导师线判定 + 固定课堂SOP）。
- 本次导师学习聚焦课程缓冲维护与课次治理同步（本轮不调整能力分数，维持 `71%`）。
- 学员线下一课已准备：`lesson_10_2h_runbook`（敌人巡逻 + 接触伤害）。
- 课程组织已切换为“课次制”，并建立 `lesson_queue` 与“提前 3 课”备课缓冲约束。
- 学员线新增执行约束：学习过程中不切导师线备课，避免学员等待；仅在用户明确触发后切导师线。
- 本轮导师备课已扩展到第10课~第17课，备课缓冲提升为 `第10课~第17课`（8课）。

## 自动更新规则（每次“你自己学习”后执行）

1. 更新本次产出计数（模块/卡片/QA/清单/对比方案）。
2. 按规则调整维度分数（单维单次上限 +8，避免虚高）：
   - 新增 1 条 `Verified` 模块结论：`D1 +3`
   - 新增 1 条带证据的 QA：`D1 +1` 或 `D3 +1`
   - 新增 1 个 feature 多方案对比条目：`D2 +2`
   - 新增 1 个源码函数链路案例：`D3 +2`
   - 新增 1 个工程排错清单：`D4 +2`
   - 新增 1 个性能定位案例：`D4 +3`
   - 新增 1 个发布/导出/回归验证条目：`D5 +3`
   - 完成 1 次版本迁移演练：`D5 +4`
3. 重新计算 `Overall Progress`。
4. 写入本文件 + `02_mentor/docs_digest.md` + `03_sessions/handoff_latest.md`。

## 12 周目标（导师侧）

| Week | Target % | Weekly Deliverables (Minimum) |
| --- | --- | --- |
| W01 | 28 | 完成 M05 教学清单；新增 QA004-QA006；1 条方案对比 |
| W02 | 34 | QA 扩展到 QA010；补 2 条源码链路问答 |
| W03 | 40 | 建立 source quick map v1（10 个高频问题） |
| W04 | 46 | 完成 Camera/physics 常见抖动排错清单 |
| W05 | 52 | 场景组织与资源复用模式（含 2 方案对比） |
| W06 | 58 | 存档与配置方案（ConfigFile vs JSON）决策模板 |
| W07 | 63 | 性能定位基础：帧时间预算 + 3 个典型瓶颈案例 |
| W08 | 68 | 工程稳定性资产：回归检查清单 v1 |
| W09 | 73 | 渲染/资源管线源码索引图 v1 |
| W10 | 78 | 导出与平台差异清单（Windows 优先） |
| W11 | 82 | Steam 发布前技术检查表 v1 |
| W12 | 86 | 版本迁移演练报告（4.6 -> target）+ 专家问答集 |

## Weekly Progress (current)

- W01 deliverables:
  - [done] M05 教学清单补齐
  - [done] QA004-QA006（额外完成 QA007）
  - [done] feature 多方案对比条目（F001/F002）
- W01 progress: `3/3 completed`

- W02 deliverables:
  - [done] QA 扩展到 QA010（新增 QA008~QA010）
  - [done] source quick-answer map v1（10 高频问题）
  - [done] playbook 扩展到 F005
- W02 progress: `3/3 completed`

- W03 deliverables:
  - [done] quick-answer map 扩展到 20 问题
  - [done] playbook 扩展到 F010
  - [done] M07/M08 + QA011~QA015 完成
- W03 progress: `3/3 completed`

- W04 deliverables:
  - [done] quick-answer map 扩展到 30 问题（SQ21~SQ30）
  - [done] playbook 扩展到 F015
  - [done] performance casebook + Windows preflight checklist
- W04 progress: `3/3 completed`

- W05 deliverables:
  - [done] quick-answer map 扩展到 40 问题（SQ31~SQ40）
  - [done] playbook 扩展到 F020
  - [done] release risk matrix + automated regression spec
- W05 progress: `3/3 completed`

- W06 deliverables:
  - [done] quick-answer map 扩展到 50 问题（SQ41~SQ50）
  - [done] playbook 扩展到 F025
  - [done] release rehearsal samples（3 samples）+ risk matrix linkage
- W06 progress: `3/3 completed`

- W07 deliverables:
  - [done] quick-answer map 扩展到 60 问题（SQ51~SQ60）
  - [done] playbook 扩展到 F030
  - [done] M09 + QA031~QA035 + K032~K036
- W07 progress: `3/3 completed`

- W08 deliverables:
  - [done] quick-answer map 扩展到 70 问题（SQ61~SQ70）
  - [done] playbook 扩展到 F035
  - [done] RRB-001~RRB-003 真实构建回归记录 + artifacts 汇总
- W08 progress: `3/3 completed`

- W09 deliverables:
  - [done] quick-answer map 扩展到 80 问题（SQ71~SQ80）
  - [done] playbook 扩展到 F040
  - [done] RRB-001~RRB-005 阈值带基线（`rrb_threshold_band_v1.json`）
- W09 progress: `3/3 completed`

- W10 deliverables:
  - [done] quick-answer map 扩展到 90 问题（SQ81~SQ90）
  - [done] playbook 扩展到 F045
  - [done] M12 + QA046~QA050 + K047~K051 + 第3课 runbook/checklist
- W10 progress: `3/3 completed`

- W11 deliverables:
  - [done] quick-answer map 扩展到 100 问题（SQ91~SQ100）
  - [done] playbook 扩展到 F050
  - [done] M13 + QA051~QA055 + K052~K056 + lesson_04 runbook/checklist
- W11 progress: `3/3 completed`

## 当前两周冲刺（Now)

- Sprint Goal: `71% -> 72%`
- Must Deliver:
  1. [done] 为渲染/资源管线再补 10 个 quick-answer 条目（90 -> 100）
  2. [done] playbook 从 F045 扩展到 F050（补输入/状态流决策）
  3. [in_progress] 将阈值带接入自动化执行（脚本化判定 pass/fail）
