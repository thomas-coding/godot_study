# 第20课 - 2h Runbook（小型 Boss 原型：阶段行为 + 受击反馈）

目标：在 2 小时内完成 1 个可运行 Boss 原型，具备至少 2 个阶段行为切换与可观测受击反馈，并保证重开稳定。

## 本课唯一目标（英文）

`Today I will build a small boss prototype with phase switching and hit feedback, while keeping restart behavior stable.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行项目：确认第19课“事件联动 + 波次门控”链路可用。

## 10-30 min: 设计 Boss 最小状态模型

- 定义最小字段：
  - `phase`（如 `PHASE_1` / `PHASE_2`）
  - `hp_max` / `hp_current`
  - `phase2_hp_threshold`
  - `is_invulnerable`（受击窗口门控）
- 明确行为目标：
  - 阶段1：基础移动/攻击
  - 阶段2：提高频率或增加弹幕/冲刺

## 30-60 min: 实装阶段切换

- 在 Boss 脚本中接入阶段状态机：
  - HP 低于阈值时切换到阶段2（仅切换一次）。
  - 切换时打印或 HUD 提示阶段变化，便于验收。
- 保持最小可读实现：阶段逻辑集中在一个入口，避免散落判断。

## 60-85 min: 实装受击反馈与无敌窗口

- 接入受击流程：
  - 伤害命中时扣血。
  - 进入短暂无敌窗口（闪烁或颜色变化）。
  - 无敌期间拒绝重复扣血。
- 至少保留 1 个可观测反馈：
  - Sprite 闪烁 / 调制色变化 / 命中日志。

## 85-100 min: 回归验证

- 验证：
  1. Boss 在阶段1到阶段2切换一次且可观察
  2. 受击后无敌窗口生效，不会同帧连扣
  3. Boss 被击败后触发预期结果（开门/结算/提示）
  4. `R` 重开后 Boss 状态回到初始

## 100-110 min: 快速调参与风险收敛

- 调整 1 轮参数：
  - 阶段切换阈值、无敌时长、攻击间隔。
- 记录“课堂默认参数 + 低难度参数”各一组。

## 110-120 min: 收尾沉淀

- 更新：`learning_kb/01_learner/daily_reports/YYYY-MM-DD.md`
- 更新：`learning_kb/01_learner/current_state.md`
- 更新：`learning_kb/01_learner/mastery_map.md` / `learning_kb/01_learner/gap_backlog.md`
- 更新：`learning_kb/03_sessions/handoff_latest.md`

## 本课最小完成线

- 至少 1 个 Boss 原型可运行（可受击、可掉血、可阶段切换）。
- 至少 1 种受击反馈可观察，且无敌窗口生效。
- 重开后状态恢复正确，无红色报错。
