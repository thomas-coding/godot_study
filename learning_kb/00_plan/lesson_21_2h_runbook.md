# 第21课 - 2h Runbook（Boss 战结算与奖励循环：掉落 + 结算面板）

目标：在 2 小时内为第20课 Boss 原型补齐战斗结束后的最小奖励与结算闭环，并保证重开、切关、暂停状态稳定。

## 本课唯一目标（英文）

`Today I will add a boss defeat reward and a clear result panel without breaking restart or scene flow.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行项目：确认第20课 Boss 原型基线可用。
- 快速回归：start/pause/restart/HUD/Boss 受击/阶段切换。

## 10-25 min: 设计奖励与结算最小模型

- 定义最小字段：
  - `boss_defeated`
  - `reward_count`
  - `reward_granted`
  - `result_panel_visible`
- 选择奖励类型之一：
  1. 分数奖励（推荐课堂默认）
  2. 掉落 1 个奖励节点
  3. 解锁下一关或奖励标记
- 明确结算入口：
  - Boss HP <= 0 -> 发出 defeated 信号 -> Main 统一处理奖励和结算 UI。

## 25-50 min: 实装 Boss 击败信号与奖励发放

- 在 Boss 脚本中新增 `defeated` 信号。
- HP 第一次降到 0 时只发一次信号，使用 `is_defeated` 或 `reward_granted` 防重复。
- 在 `Main` 中接入信号：
  - 增加奖励计数或生成奖励节点。
  - 刷新 HUD/结算面板。
- 若选择掉落节点：
  - 使用 `PackedScene.instantiate()` 创建奖励。
  - 设置掉落位置为 Boss 当前位置。
  - 控制掉落只发生一次。

## 50-80 min: 实装结算面板

- 推荐 UI 结构：
  - `HUD(CanvasLayer)`
    - `ResultPanel(Control 或 Panel)`
      - `TitleLabel(Label)`
      - `RewardLabel(Label)`
      - `RestartButton(Button)`
      - `NextButton(Button，可选)`
- 关键属性：
  - `ResultPanel.visible = false` 初始隐藏。
  - 面板显示时隐藏或弱化运行时 HUD 标签。
  - `RestartButton.pressed` 连接到重开逻辑。
- 结算显示内容至少包含：
  - Boss defeated
  - Reward +N
  - Restart 提示或按钮

## 80-95 min: 状态门控与暂停一致性

- Boss 击败后进入稳定终态：
  - 推荐复用 `WON` 或新增 `BOSS_CLEAR` 状态。
- 确认结算状态下：
  - 敌人攻击不再扣血。
  - Boss 不再处理受击。
  - `P` 暂停不会打乱结算面板。
  - `R` 重开可恢复 Boss、奖励、面板初始态。

## 95-110 min: 回归验证

- 验证：
  1. Boss 被击败后奖励只发一次。
  2. 结算面板显示正确。
  3. 重开后 Boss 和奖励状态恢复初始。
  4. 暂停/继续不破坏结算状态。
  5. 如配置下一关，切关后不保留本关结算面板状态。

## 110-120 min: 收尾沉淀

- 更新：`learning_kb/01_learner/daily_reports/YYYY-MM-DD.md`
- 更新：`learning_kb/01_learner/current_state.md`
- 更新：`learning_kb/01_learner/mastery_map.md` / `learning_kb/01_learner/gap_backlog.md`
- 更新：`learning_kb/03_sessions/handoff_latest.md`

## 本课最小完成线

- Boss 击败后能触发 1 次奖励。
- 结算面板可见，且能显示奖励结果。
- 奖励和面板不会重复触发。
- `R` 重开后恢复初始状态，无红色报错。

## 导师证据锚点

- `godot/doc/classes/Control.xml`：UI 控件、输入事件处理、`mouse_filter` 与布局预设。
- `godot/doc/classes/CanvasLayer.xml`：HUD 独立渲染层与显示顺序。
- `godot/doc/classes/RandomNumberGenerator.xml`：可选随机奖励选择，固定 seed 可复现。
- `godot/scene/gui/base_button.cpp`：`Button.pressed` 信号触发链路。
