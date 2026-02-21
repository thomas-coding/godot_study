# 第16课 - 2h Runbook（性能优化与帧预算回归：Profiler + checklist）

目标：在 2 小时内建立可复用的性能排查闭环，完成一次基于 Profiler 的瓶颈定位与最小优化验证。

## 本课唯一目标（英文）

`Today I will profile the game, fix at least one measurable bottleneck, and keep a repeatable performance checklist.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行项目：确认第15课数据驱动配置基线可用。

## 10-30 min: 定义帧预算与测试场景

- 设定本课最小帧预算目标（例如 60 FPS 对应约 16.6ms）。
- 选择 1 个最容易触发压力的场景（敌人+收集物+UI 同时活跃）。
- 记录初始基线：平均帧时间、峰值帧时间、卡顿触发条件。

## 30-60 min: Profiler 采样与热点定位

- 打开 Godot Profiler，重点观察：
  - `Process` / `Physics Process` 峰值区间
  - 脚本函数调用次数与耗时
  - 可疑节点的 `_process` / `_physics_process` 负载
- 锁定 1 个可解释且可修改的热点（例如重复查询、频繁实例化、无门控更新）。

## 60-85 min: 实施最小优化

- 对热点做 1~2 项小改动，优先不改玩法语义：
  - 减少无效每帧计算（加状态门控/缓存中间结果）
  - 降低不必要的节点更新频率
  - 将调试输出限制在开发开关下
- 保持改动可回退，不做大规模重构。

## 85-100 min: 回归采样对比

- 在同一测试场景重新采样并与基线对比。
- 记录至少 1 项可量化改善（例如峰值下降、抖动次数减少）。
- 确认优化后玩法与状态机/HUD 行为一致。

## 100-110 min: 生成性能检查清单

- 产出最小 checklist（后续课可复用）：
  1. 是否先定义帧预算与压力场景
  2. 是否先采样再优化（避免盲改）
  3. 是否有优化前后对比数据
  4. 是否验证玩法无回归

## 110-120 min: 收尾沉淀

- 更新：`learning_kb/01_learner/daily_reports/YYYY-MM-DD.md`
- 更新：`learning_kb/01_learner/current_state.md`
- 更新：`learning_kb/01_learner/mastery_map.md` / `learning_kb/01_learner/gap_backlog.md`
- 更新：`learning_kb/03_sessions/handoff_latest.md`

## 本课最小完成线

- 完成一次 Profiler 采样并识别至少 1 个热点。
- 至少完成 1 项最小优化且有前后数据对比。
- 主流程可玩，无红色报错。
