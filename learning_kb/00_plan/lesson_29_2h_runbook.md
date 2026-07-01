# 第29课 - 2h Runbook（音频系统基础）

目标：在 2 小时内接入或规划最小音频反馈，理解音效、背景音乐、Audio Bus 与音量设置之间的边界。

## 本课唯一目标（英文）

`Today I will connect basic audio feedback to gameplay events and keep volume control separate from gameplay rules.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行项目，确认第28课反馈时序基线可用。
- 快速回归：
  - settings volume slider
  - Boss reward popup
  - hit feedback
  - pause/restart

## 10-25 min: 固定学习边界

- 本课重点是音频系统边界，不是找大量素材。
- 学习对象：
  1. `AudioStreamPlayer` / `AudioStreamPlayer2D` 基础。
  2. 音效事件触发点。
  3. 背景音乐与场景生命周期。
  4. Audio Bus 音量控制。
- 明确不做：
  - 不做完整混音。
  - 不做动态音乐系统。
  - 不做平台音频延迟优化。

## 25-45 min: 当前音量设置链路复盘

- 检查：
  - `projects/first-game/scenes/hud.gd`
  - `projects/first-game/scenes/save_manager.gd`
  - `projects/first-game/scenes/hud.tscn`
- 重点确认：
  - Settings slider 改的是 AudioServer / Master bus 音量。
  - 保存层负责跨重启持久化。
  - UI slider 不决定 gameplay 规则。
- 验收：
  - 学员能说明音量设置属于应用设置，不属于胜负或分数规则。

## 45-70 min: 最小音效接入点设计

- 选择 2-3 个事件作为音效点：
  - coin collected
  - player hit
  - Boss defeated / reward
- 推荐实现：
  - 在 HUD 或 Main 下放置少量 `AudioStreamPlayer`。
  - 由 Main 的事件处理函数触发播放。
  - 若无素材，可先用占位资源计划表，不强行实现。
- 验收：
  - 学员能指出音效触发点应靠近“事件已确认”的位置，而不是在检测层提前播放。

## 70-90 min: Audio Bus 与分层

- 建立最小分层概念：
  - Master：总音量。
  - SFX：短音效。
  - Music：背景音乐。
- 如果项目只有 Master，也记录为当前阶段足够。
- 讨论何时需要新增 bus：
  - 玩家想单独调音效/音乐。
  - 需要 ducking 或混音效果。
- 验收：
  - 学员能说出 Master 与 SFX/Music 的职责差异。

## 90-110 min: 回归验证

- 固定路线：
  1. 调整音量 slider。
  2. 触发 coin / hit / Boss reward。
  3. `P` 暂停/恢复。
  4. `R` 重开。
  5. 重启项目后确认音量设置恢复。
- 验收：
  - 音量设置不破坏 gameplay。
  - 若新增音效，触发时机正确且不会重复爆发。
  - 无红色 error。

## 110-120 min: 收尾沉淀

- 写一张最小音频表：
  - event
  - sound owner node
  - bus
  - repeat guard
  - pause/restart expectation
- 更新学习记录。

## 本课最小完成线

- 学员能解释音效、音乐、Audio Bus、音量持久化的边界。
- 至少确认 2-3 个适合接音效的事件点。
- Settings 音量链路无回归。
- 无红色 error。

## 导师证据锚点

- `godot/doc/classes/AudioStreamPlayer.xml`
- `godot/doc/classes/AudioStreamPlayer2D.xml`
- `godot/doc/classes/AudioServer.xml`
- `learning_kb/02_mentor/modules/M16_runtime_settings_application_audio_window_inputmap.md`
- `learning_kb/02_mentor/modules/M23_feedback_audio_and_data_driven_boundaries.md`
