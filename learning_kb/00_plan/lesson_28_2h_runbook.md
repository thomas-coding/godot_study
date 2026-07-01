# 第28课 - 2h Runbook（Animation / Tween / Timer 反馈系统）

目标：在 2 小时内整理当前项目中的一次性反馈、持续状态、延迟行为与冷却行为，学习 Animation/Tween/Timer 的选择边界。

## 本课唯一目标（英文）

`Today I will choose the right feedback timing tool for short effects, continuous states, and delayed gameplay events.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行项目，确认第27课 UI 状态流基线可用。
- 快速回归：
  - start / pause / restart
  - HUD score/hp/objective
  - Boss reward popup
  - Player hit flash
  - Boss hit flash

## 10-25 min: 固定学习边界

- 本课重点是“反馈时序工具选择”，不是美术 polish。
- 学习对象：
  1. 临时视觉反馈：受击闪烁、奖励弹窗。
  2. 持续状态：暂停、胜负终态。
  3. 延迟行为：短时间后隐藏提示。
  4. 冷却行为：Boss 无敌窗口、敌人发射间隔。
- 明确不做：
  - 不做完整动画状态机。
  - 不做复杂过场。
  - 不做新美术资源。

## 25-45 min: 现有反馈时序盘点

- 检查当前代码：
  - `projects/first-game/scenes/player.gd`
  - `projects/first-game/scenes/boss.gd`
  - `projects/first-game/scenes/hud.gd`
  - `projects/first-game/scenes/enemy.gd`
- 标记每个反馈现在用什么实现：
  - `create_timer()` 临时恢复颜色/隐藏提示。
  - `_physics_process(delta)` 持续更新移动/冷却。
  - UI `visible` 切换表示状态。
- 验收：
  - 学员能说出哪些是“一次性反馈”，哪些是“持续状态”。

## 45-70 min: Timer / SceneTreeTimer 边界

- 阅读并确认：
  - Boss 无敌窗口使用 timer 后恢复可受击。
  - HUD 临时提示使用 timer 后隐藏。
- 讨论规则：
  - 简单 one-shot 延迟优先 `get_tree().create_timer()`。
  - 需要编辑器可见、可复用、可暂停配置时再使用 `Timer` 节点。
  - 暂停期间是否继续计时必须显式设计。
- 验收：
  - 学员能解释为什么 Boss 无敌窗口不能被重复伤害绕过。
  - 学员能解释暂停时临时提示是否继续倒计时的设计取舍。

## 70-90 min: Tween / AnimationPlayer 选择边界

- 本课可不强制新增实现，重点建立选择表：
  - `Tween`：代码驱动的短暂插值，如淡入淡出、缩放、数字变化。
  - `AnimationPlayer`：可在编辑器编排、多轨道、可复用的动画片段。
  - 直接改属性 + timer：最小受击闪烁、简单提示。
- 若课堂时间充足，可把一个 HUD popup 隐藏逻辑重构为 `Tween` 淡出。
- 验收：
  - 学员能给出当前项目里 2 个适合 Tween 的例子和 1 个适合 AnimationPlayer 的例子。

## 90-110 min: 回归验证

- 固定路线：
  1. `Enter` 开始。
  2. 侧碰敌人/Boss，确认 hit feedback。
  3. 踩 Boss，确认 Boss hit feedback 与 invulnerability。
  4. 击败 Boss，确认 reward popup。
  5. `P` 暂停/恢复。
  6. `R` 重开。
- 验收：
  - 反馈不阻塞 gameplay。
  - 暂停/重开后没有残留提示或错误状态。
  - 无红色 error。

## 110-120 min: 收尾沉淀

- 记录一张最小选择表：
  - feedback type
  - recommended tool
  - pause behavior
  - reset expectation
- 更新学习记录。

## 本课最小完成线

- 学员能区分一次性反馈、持续状态、延迟行为、冷却行为。
- 学员能说明 `SceneTreeTimer`、`Timer`、`Tween`、`AnimationPlayer` 的选择边界。
- 当前 hit feedback / reward popup / pause / restart 无回归。
- 无红色 error。

## 导师证据锚点

- `godot/doc/classes/SceneTree.xml`：`create_timer` 与暂停语义。
- `godot/doc/classes/Timer.xml`：节点式 timer 与 process callback。
- `godot/doc/classes/Tween.xml`：属性插值与生命周期。
- `godot/doc/classes/AnimationPlayer.xml`：编辑器编排动画。
- `learning_kb/02_mentor/modules/M15_scenetreetimer_pause_time_scale_and_update_order.md`
- `learning_kb/02_mentor/modules/M23_feedback_audio_and_data_driven_boundaries.md`
