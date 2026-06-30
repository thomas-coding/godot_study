# Mentor Progress Dashboard

Last Updated: 2026-06-30
Active Baseline: Godot 4.6 stable
Overall Progress: 80%

## 评分模型（5 维度）

- 每个维度满分 100，权重相同（20%）。
- 总进度计算：`Overall% = round((D1 + D2 + D3 + D4 + D5) / 5)`。

| Dimension | Score | Weight | Contribution | Current Evidence | Main Gap |
| --- | --- | --- | --- | --- | --- |
| D1 Runtime & Core API Mastery | 100 | 20% | 20.0 | M01-M20、K001-K082、QA001-QA084 | 需继续扩展到渲染深水区与工程边界案例 |
| D2 Feature Solution Design | 98 | 20% | 19.6 | playbook 扩展到 F001~F085；新增学习型课程规划与第25~27课能力覆盖 runbook | 需补第28~30课 learning-first runbook |
| D3 Source-level Q&A Speed | 100 | 20% | 20.0 | quick-answer map v1 已扩展到 170 问题 | 需补渲染源码链路的答复模板化 |
| D4 Engineering Reliability | 54 | 20% | 10.8 | 排错清单 + 性能案例库 + 自动回归规范 + 阈值带样本 + 第16课 Profiler 证据纪律复盘 + 第22课 alpha 回归 runbook + 第25~27课学习边界 runbook | 缺自动化执行样本与阈值调优 |
| D5 Shipping & Version Governance | 48 | 20% | 9.6 | 版本治理 + preflight + 风险矩阵 + 阈值证据链 + 第23课 Windows 导出干跑 runbook + M20 导出验证资产 | 缺 Steam 上线前端到端演练与指标闭环 |

## 等级解释

- `0-24`: 基础起步（能覆盖核心概念，稳定性不足）。
- `25-49`: 可教学（可指导常见任务，深度仍不均衡）。
- `50-74`: 进阶导师（能稳定指导 feature 设计与疑难排错）。
- `75-100`: 专家导师（源码级解释快、方案对比成熟、发布链路完备）。

Current Level: `专家导师`（达到 75+ 门槛）。

Governance Update:

- 双轨长期治理协议已固化（学员线/导师线判定 + 固定课堂 SOP + 原子步骤卡门禁）。
- 学员线第16课已完成：Profiler 帧预算采样 + 曲线尖峰解释 + 优化证据纪律复盘。
- 学员线第18课已完成：触发器事件系统 + 一次性去重 + 重开恢复。
- 学员线第20课已完成：小型 Boss 原型（HP、阶段切换、受击反馈、无敌窗口、击败、重开稳定）。
- 学员线第21课已完成：Boss 击败信号、一次性奖励、HUD 奖励提示、Goal 解锁归属修正。
- 学员线第22课已完成：当前版本完整主链路 alpha 回归测试通过。
- 学员线第23课已完成：Windows 导出干跑 + 导出包 smoke test 通过。
- 学员线下一课切换为：`lesson_24_2h_runbook`（Boss 战能力补齐与区域门控）。
- 本轮导师学习聚焦“本地 Godot 学习路线 + 第25~27课备课缓冲恢复”。
- 备课缓冲已更新为 `第24课~第27课`（4课），满足至少提前 3 课要求。
- 本轮新增/更新导师资产：`M22`、`K085~K087`、`QA087~QA089`、`lesson_25~27_2h_runbook`、`SQ166~SQ170`。

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

- W12 deliverables:
  - [done] quick-answer map 扩展到 110 问题（SQ101~SQ110）
  - [done] playbook 扩展到 F055
  - [done] M14 + QA056~QA060 + K057~K061（第12课场景切换教学资产）
- W12 progress: `3/3 completed`

- W13 deliverables:
  - [done] quick-answer map 扩展到 120 问题（SQ111~SQ120）
  - [done] playbook 扩展到 F060
  - [done] M15 + QA061~QA065 + K062~K066（SceneTreeTimer 时序教学资产）
- W13 progress: `3/3 completed`

- W14 deliverables:
  - [done] quick-answer map 扩展到 140 问题（SQ131~SQ140）
  - [done] playbook 扩展到 F070
  - [done] M17 + QA071~QA075 + K071~K074 + lesson_19 runbook
- W14 progress: `3/3 completed`

- W15 deliverables:
  - [done] quick-answer map 扩展到 150 问题（SQ141~SQ150）
  - [done] playbook 扩展到 F075
  - [done] M18 + QA076~QA080 + K075~K078 + lesson_20 runbook
- W15 progress: `3/3 completed`

- W16 deliverables:
  - [done] quick-answer map 扩展到 160 问题（SQ151~SQ160）
  - [done] playbook 扩展到 F080
  - [done] M19 + QA081~QA082 + K079~K080 + lesson_22 runbook
- W16 progress: `3/3 completed`

- W17 deliverables:
  - [done] quick-answer map 扩展到 165 问题（SQ161~SQ165）
  - [done] playbook 扩展到 F085
  - [done] M20 + QA083~QA084 + K081~K082 + lesson_23 runbook
- W17 progress: `3/3 completed`

- W18 deliverables:
  - [done] M21 + QA085~QA086 + K083~K084（Boss encounter 设计边界）
  - [done] lesson_24 runbook，保持第22~24课备课缓冲
  - [done] quick-answer map 扩展到 170 问题（SQ166~SQ170）
- W18 progress: `3/3 completed`

- W19 deliverables:
  - [done] M22 + QA087~QA089 + K085~K087（本地学习型课程规划）
  - [done] lesson_25~lesson_27 runbook，恢复第24~27课备课缓冲
  - [pending] 第28~30课 runbook（Animation/Tween/Timer、音频、Resource 深化）
- W19 progress: `2/3 completed`

## 当前两周冲刺（Now)

- Sprint Goal: `79% -> 80%`
- Must Deliver:
  1. [in_progress] 将阈值带接入自动化执行（脚本化判定 pass/fail）
  2. [done] 将长期目标调整为本地 Godot 学习路线，并降级 Steam 发布主线
  3. [done] 补齐第25课~第27课 runbook，恢复 >=3 课缓冲
  4. [done] 补齐 M22/K085~K087/QA087~QA089 与 SQ166~SQ170
