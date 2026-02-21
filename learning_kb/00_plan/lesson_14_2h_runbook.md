# 第14课 - 2h Runbook（设置菜单：音量/窗口/快捷键入口）

目标：在 2 小时内建立最小设置菜单，让玩家可在游戏内调整关键选项并即时生效。

## 本课唯一目标（英文）

`Today I will build a minimal in-game settings menu and apply runtime changes safely.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行项目：确认第13课存档基线可用。

## 10-35 min: 构建设置菜单UI

- 在 HUD 或独立 `SettingsPanel` 添加最小控件：
  - 音量滑条（Master）
  - 窗口模式切换（Windowed/Fullscreen）
  - 返回按钮
- 统一菜单显示/隐藏入口（例如在 `PAUSED` 状态进入设置）。

## 35-65 min: 运行时应用设置

- 音量：通过 `AudioServer` 设置 bus 音量。
- 窗口：通过 `DisplayServer` 或项目API切换模式。
- 任何设置变更都即时可见，且不打断主流程。

## 65-90 min: 与存档联动

- 将设置项写回 `ConfigFile`（复用第13课 SaveManager）。
- 启动时自动应用上次设置。

## 90-105 min: 回归验证

- 验证：
  1. 进入设置菜单不破坏状态机
  2. 音量调整立即生效
  3. 窗口模式切换正常
  4. 重启后设置保持

## 105-120 min: 收尾沉淀

- 更新：`learning_kb/01_learner/daily_reports/YYYY-MM-DD.md`
- 更新：`learning_kb/01_learner/current_state.md`
- 更新：`learning_kb/01_learner/mastery_map.md` / `learning_kb/01_learner/gap_backlog.md`
- 更新：`learning_kb/03_sessions/handoff_latest.md`

## 本课最小完成线

- 设置菜单可打开/关闭并可实际修改至少 2 项设置。
- 设置项可持久化并在下次启动生效。
- 不影响主玩法闭环。
