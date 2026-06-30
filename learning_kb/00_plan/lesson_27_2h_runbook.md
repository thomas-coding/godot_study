# 第27课 - 2h Runbook（UI/菜单系统与状态流）

目标：在 2 小时内把主菜单、暂停菜单、设置面板、结算提示这些 UI 视为一套状态流来学习，避免 UI 显示和游戏状态互相污染。

## 本课唯一目标（英文）

`Today I will organize the UI and menu flow so each screen matches one clear gameplay state.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行项目，确认第26课输入整理后主链路可用。
- 快速回归：
  - HUD score/hp/objective
  - pause label/panel
  - settings panel
  - Boss reward popup
  - win/game-over panel

## 10-25 min: 固定 UI 学习边界

- 本课重点是 UI 状态流，不是美术打磨。
- 学习对象：
  1. HUD：持续显示当前状态。
  2. Pause UI：暂停期间显示与操作。
  3. Settings UI：可关闭的模式面板。
  4. Reward popup：临时事件反馈。
  5. Win/Game Over：终态反馈。
- 明确不做：
  - 不做完整美术主题。
  - 不做动画 polish。
  - 不做复杂主菜单美术。

## 25-45 min: UI 状态清单

- 在项目中列出每个 UI 元素对应状态：
  - WAIT_START
  - PLAYING
  - PAUSED
  - GAME_OVER
  - WON
  - temporary reward/message
- 验收：
  - 每个 UI 都能对应到明确状态或临时事件。
  - 没有“既像终态又像奖励”的混合提示。

## 45-65 min: HUD 与终态 UI 边界

- 检查 `hud.gd` / `hud.tscn`：
  - Score/HP/Goal 属于持续 HUD。
  - Boss reward 属于临时反馈。
  - Win/Game Over 属于终态。
- 验收：
  - Boss reward 不抢占 Win/Game Over 语义。
  - Win/Game Over 不被普通提示误触发。

## 65-85 min: 菜单和暂停状态

- 检查暂停与设置面板：
  - Pause UI 只在暂停相关状态出现。
  - Settings panel 打开时，输入边界清晰。
  - 关闭设置后回到正确状态。
- 验收：
  - 暂停后打开/关闭设置不破坏 `P` 恢复。
  - `R` 重开后 UI 回到初始状态。

## 85-105 min: 最小 UI 状态表

- 写一张最小状态表到学习记录或课堂笔记：
  - 状态
  - 显示 UI
  - 允许输入
  - 退出方式
  - 重开后的期望
- 验收：
  - 学员能用表解释 UI 为什么这样显示。
  - 后续新增 UI 时能按表检查。

## 105-120 min: 回归与收尾

- 回归路线：
  1. `Enter` 开始。
  2. 收集 coin，确认 HUD。
  3. `P` 暂停并打开设置。
  4. 关闭设置并恢复。
  5. 触发 Boss reward。
  6. 到 Goal/Won 或 Game Over。
  7. `R` 重开。
- 更新学习记录。

## 本课最小完成线

- 学员能解释 HUD、菜单、临时反馈、终态 UI 的边界。
- 当前 UI 状态流无明显冲突。
- 有一份可复用的 UI 状态表。
- 无红色 error。

## 导师证据锚点

- `godot/doc/classes/Control.xml`：UI 控件、布局、输入处理。
- `godot/doc/classes/CanvasLayer.xml`：HUD 覆盖层。
- `godot/doc/classes/SceneTree.xml`：暂停与场景重开。
- `godot/doc/classes/Node.xml`：process mode 与生命周期。
- `learning_kb/02_mentor/modules/M18_embedded_run_window_modes_and_modal_ui_layout.md`
- `learning_kb/02_mentor/cards/K084_reward_popup_is_not_completion_state.md`
