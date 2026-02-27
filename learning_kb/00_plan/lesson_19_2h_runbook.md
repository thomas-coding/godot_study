# 第19课 - 2h Runbook（敌人与事件联动：波次刷新 + 门控）

目标：在 2 小时内把“触发器事件”和“敌人波次”联动起来，实现清波后开门且可稳定重开。

## 本课唯一目标（英文）

`Today I will link trigger events with enemy wave spawning and gate unlock logic in a restart-safe way.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行项目：确认第18课触发器 + 一次性事件基线可用。

## 10-30 min: 设计联动最小模型

- 定义 1 个“波次事件”数据结构（可字典或资源字段）：
  - `wave_id`
  - `enemy_scene`
  - `spawn_points`（数组）
  - `unlock_target`（门或障碍）
- 约定状态字段：`wave_started` / `wave_cleared`，避免重复触发。

## 30-60 min: 实装触发刷怪

- 在第18课事件入口接入“刷怪动作”：
  - 使用 `PackedScene.instantiate()` 生成敌人。
  - 统一加入敌人组（例如 `enemies`）。
- 增加去重保护：同一 `wave_id` 本局只触发一次。

## 60-85 min: 清波门控

- 选择一个稳定判定口径：
  - 推荐：`get_node_count_in_group("enemies") == 0` 触发开门。
- 将“开门/移除障碍”与“波次清空”绑定，确保只执行一次。
- 处理时序：避免在敌人同帧 `queue_free` 时误判（可用 `tree_exited` 或 deferred 检查）。

## 85-100 min: 回归验证

- 验证：
  1. 触发器只刷一次波次，不会重复刷怪
  2. 清空敌人后门控正确解锁
  3. `R` 重开后波次和门控恢复初始态
  4. 切到下一关不污染本关波次状态

## 100-110 min: 难度快速调参

- 微调 1 轮参数（敌人数、刷新点、敌人初速度/冷却）。
- 记录“课堂默认参数 + 低难度参数”各一组，便于演示切换。

## 110-120 min: 收尾沉淀

- 更新：`learning_kb/01_learner/daily_reports/YYYY-MM-DD.md`
- 更新：`learning_kb/01_learner/current_state.md`
- 更新：`learning_kb/01_learner/mastery_map.md` / `learning_kb/01_learner/gap_backlog.md`
- 更新：`learning_kb/03_sessions/handoff_latest.md`

## 本课最小完成线

- 至少 1 个触发器可刷出 1 波敌人并完成清波后门控动作。
- 波次去重有效，重开后恢复初始可触发。
- 主流程可玩，无红色报错。
