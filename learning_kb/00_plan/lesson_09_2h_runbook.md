# 第9课 - 2h Runbook（HUD重构 + 提示层规范）

目标：在 2 小时内把当前分散的 UI 提示整理为稳定 HUD 层，提升可读性与维护性。

## 本课唯一目标（英文）

`Today I will build a clean HUD layer and make gameplay feedback consistent across all game states.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行项目：确认第8课状态机基线可用。

## 10-35 min: 整理 HUD 结构

- 新建 `HUD` 场景（推荐根节点 `CanvasLayer`）。
- 将现有标签迁移到 HUD：
  - `ScoreLabel`, `HpLabel`, `StartLabel`, `PauseLabel`, `GameOverLabel`, `WinLabel`, `RestartLabel`
- 在 `Main` 实例化 `HUD`，保持功能不变先跑通。

## 35-65 min: 统一 UI 更新接口

- 为 HUD 脚本提供最小接口（示例）：
  - `set_score(value)`
  - `set_hp(value)`
  - `set_state_hint(game_state)`
- `Main` 只更新状态与数值，不直接拼接多处 UI 细节。

## 65-90 min: 提示策略与可读性

- 规范提示优先级（同屏只出现一个主状态提示）：
  - `Start` / `Paused` / `Game Over` / `You Win`
- 调整文本位置与字号，避免重叠与遮挡核心玩法区域。
- 维持最小样式统一（颜色、对齐、边距）。

## 90-105 min: 回归验证

- 验证完整链路：
  1. 开始前提示正确
  2. 进行中分数/血量实时更新
  3. 暂停/失败/胜利提示互斥
  4. 重开恢复所有 UI 到初始状态

## 105-120 min: 收尾沉淀

- 更新：`learning_kb/01_learner/daily_reports/YYYY-MM-DD.md`
- 更新：`learning_kb/01_learner/current_state.md`
- 更新：`learning_kb/01_learner/mastery_map.md` / `learning_kb/01_learner/gap_backlog.md`
- 更新：`learning_kb/03_sessions/handoff_latest.md`

## 本课最小完成线

- HUD 结构清晰，主状态提示不冲突。
- Main 与 UI 职责分离程度提升。
- 不影响现有玩法闭环与输入状态机。
