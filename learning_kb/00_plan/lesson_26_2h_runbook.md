# 第26课 - 2h Runbook（输入与交互系统整理）

目标：在 2 小时内整理 gameplay input、UI input、暂停态输入和改键入口的边界，学习 Godot 输入系统的实际项目用法。

## 本课唯一目标（英文）

`Today I will separate gameplay input, UI input, pause input, and rebinding boundaries in the current Godot project.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行项目，确认第25课后主链路可用。
- 快速回归：
  - movement/jump
  - start
  - pause/resume
  - restart
  - settings button/panel

## 10-25 min: 固定输入学习边界

- 本课只整理输入边界，不做完整可视化改键系统。
- 本课重点：
  1. `InputMap` 是动作定义。
  2. gameplay input 应受游戏状态门控。
  3. UI input 由 `Control` 与焦点/鼠标过滤处理。
  4. pause/restart/start 是全局热键，但仍要有状态规则。
- 明确不做：
  - 不做完整键位编辑 UI。
  - 不做手柄适配。
  - 不做复杂输入提示系统。

## 25-45 min: 检查 InputMap 与项目动作

- 打开 Godot：
  - `Project` -> `Project Settings...` -> `Input Map`
- 检查动作：
  - `move_left`
  - `move_right`
  - `jump`
  - start/pause/restart 若已在脚本中硬编码，记录为后续整理点。
- 验收：
  - 学员能说明 action name 与 physical key 的区别。
  - 学员能说明为什么脚本里应读 action，而不是散落读取具体键。

## 45-65 min: 检查 gameplay input 门控

- 检查 Player 和 Main 输入相关函数：
  - Player 移动/跳跃只在可玩状态有效。
  - Main 处理 start/pause/restart。
  - 暂停时 gameplay 节点不应继续运动。
- 验收：
  - WAIT_START 时角色不乱动。
  - PAUSED 时角色不继续运动。
  - GAME_OVER/WON 后不继续受 gameplay input 影响。

## 65-85 min: 检查 UI input 边界

- 检查设置按钮和设置面板：
  - UI 控件不应让同一次点击穿透触发 gameplay 行为。
  - 打开设置面板时，背景 gameplay 不应继续误操作。
- 观察参数：
  - `mouse_filter`
  - focus
  - pause state
- 验收：
  - 点击 UI 不触发意外移动/重开。
  - 设置面板打开/关闭路径明确。

## 85-105 min: 改键入口边界说明

- 当前只建立改键设计边界：
  - 运行时改 `InputMap` 不会自动持久化。
  - 保存改键需要写入 `user://` 配置。
  - 恢复默认可重新加载 ProjectSettings 中的输入。
- 若项目已有 placeholder，确认它仍标记为 placeholder。
- 验收：
  - 学员能说出“改键 UI”和“InputMap 数据修改”不是一回事。
  - 学员能说出“运行时改键”和“重启后保留”之间需要保存层。

## 105-120 min: 回归与收尾

- 回归：
  - movement/jump
  - start/pause/restart
  - settings panel open/close
  - Boss/Goal 主链路不被输入整理影响
- 更新学习记录。

## 本课最小完成线

- 学员能区分 gameplay input、UI input、pause hotkey、rebind persistence。
- 当前项目输入路径无回归。
- 至少记录一条后续真实改键实现的 P1/P2 项。
- 无红色 error。

## 导师证据锚点

- `godot/doc/classes/InputMap.xml`：action/event 管理与运行时修改。
- `godot/doc/classes/Node.xml`：`_input`、`_unhandled_input`、process mode。
- `godot/doc/classes/Viewport.xml`：输入分发与 handled 传播。
- `godot/doc/classes/Control.xml`：GUI input、mouse filter、focus。
- `learning_kb/02_mentor/modules/M13_input_dispatch_pause_gates_and_scene_reload_semantics.md`
- `learning_kb/02_mentor/modules/M16_runtime_settings_application_audio_window_inputmap.md`
