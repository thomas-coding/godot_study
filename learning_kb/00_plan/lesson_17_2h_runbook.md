# 第17课 - 2h Runbook（敌人扩展：追踪/投射物与战斗反馈）

目标：在 2 小时内扩展敌人威胁模型，加入“追踪或投射物”之一，并补齐玩家可感知的战斗反馈。

## 本课唯一目标（英文）

`Today I will add one advanced enemy behavior and clear combat feedback without breaking the current game loop.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行项目：确认第16课性能优化基线可用。

## 10-30 min: 选定扩展行为并定义规则

- 二选一：
  1. 近距离追踪（进入检测范围后追击，离开后回巡逻）
  2. 简单投射物（定时发射，命中造成伤害）
- 约定清晰状态与冷却规则，避免无限触发。

## 30-60 min: 实装敌人扩展行为

- 为敌人新增检测区与行为门控（只在 `PLAYING` 生效）。
- 若为追踪：限制追踪速度与回归巡逻条件。
- 若为投射物：控制发射频率、生命周期与回收。

## 60-85 min: 增加战斗反馈

- 加入至少 2 类反馈：
  - 受击闪烁/短暂无敌提示（任选其一）
  - 音效或 HUD 提示更新
- 反馈需与状态机一致（`GAME_OVER/WON/PAUSED` 不再继续战斗反馈）。

## 85-100 min: 回归验证

- 验证：
  1. 新行为可稳定触发且可复现
  2. 战斗反馈可见且不干扰操作
  3. 重开后敌人与反馈状态恢复

## 100-110 min: 难度与平衡快速调参

- 利用第15课 Resource 参数做 1 轮调参（速度/冷却/伤害）。
- 记录一组“默认值 + 简单值”供后续测试切换。

## 110-120 min: 收尾沉淀

- 更新：`learning_kb/01_learner/daily_reports/YYYY-MM-DD.md`
- 更新：`learning_kb/01_learner/current_state.md`
- 更新：`learning_kb/01_learner/mastery_map.md` / `learning_kb/01_learner/gap_backlog.md`
- 更新：`learning_kb/03_sessions/handoff_latest.md`

## 本课最小完成线

- 至少实现 1 种敌人扩展行为（追踪或投射物）。
- 至少 2 类战斗反馈可稳定触发。
- 主流程可玩，无红色报错。
