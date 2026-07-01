# 第30课 - 2h Runbook（Resource 与数据驱动深化）

目标：在 2 小时内复盘并深化当前项目的 Resource 数据驱动方式，重点学习共享资源、运行时状态和配置数据的边界。

## 本课唯一目标（英文）

`Today I will separate reusable Resource configuration from runtime mutable gameplay state.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行项目，确认第29课音频/设置基线可用。
- 快速回归：
  - default balance
  - movement/jump
  - enemy damage
  - Boss route
  - pause/restart

## 10-25 min: 固定学习边界

- 本课重点是 Resource 数据边界，不是新增大量配置项。
- 学习对象：
  1. `GameBalanceConfig` 作为配置数据。
  2. `.tres` 文件作为可复用参数集。
  3. Runtime mutable state 与 Resource 的区别。
  4. Inspector 覆盖与默认 preload 的关系。
- 明确不做：
  - 不做大型数据表系统。
  - 不做关卡编辑器。
  - 不做复杂存档 schema。

## 25-45 min: 当前 Resource 链路复盘

- 检查：
  - `projects/first-game/configs/game_balance_config.gd`
  - `projects/first-game/configs/balance_default.tres`
  - `projects/first-game/configs/balance_easy.tres`
  - `projects/first-game/scenes/main.gd`
  - `projects/first-game/scenes/player.gd`
  - `projects/first-game/scenes/enemy.gd`
- 验收：
  - 学员能说明哪些字段是配置，哪些字段是运行时状态。

## 45-70 min: Resource 共享与运行时修改边界

- 重点规则：
  - Resource 适合保存“设计时配置”。
  - HP、当前分数、Boss 当前阶段等运行时状态不应直接写回共享 Resource。
  - 如果必须运行时修改配置副本，应先考虑 `duplicate()` 或局部实例。
- 讨论例子：
  - `player_hp` 是初始配置。
  - `hp` 是当前运行时状态。
  - `hp_current` 是 Boss 当前运行时状态。
- 验收：
  - 学员能解释为什么 `hp -= damage` 不应该改 `balance_config.player_hp`。

## 70-90 min: 选择一个小配置项做设计评审

- 从当前项目选择一个候选：
  - Boss reward amount
  - Boss hp_max / phase threshold
  - Audio volume defaults
  - Projectile parameters
- 判断是否适合 Resource：
  - 是否多处复用？
  - 是否需要 Inspector 调参？
  - 是否是设计时配置而非运行时结果？
- 可选实现：仅当时间充足，把一个现有 export 参数迁入配置；否则只记录设计结论。
- 验收：
  - 学员能用判断表说明为什么某个数据适合或不适合 Resource。

## 90-110 min: 回归验证

- 固定路线：
  1. default balance 运行主链路。
  2. 切到 easy balance 做小回归。
  3. 切回 default balance。
  4. 测 movement/jump/enemy/Boss/pause/restart。
- 验收：
  - 配置切换只改变预期参数。
  - 运行时 HP/分数/Boss 状态不会污染 `.tres`。
  - 无红色 error。

## 110-120 min: 收尾沉淀

- 写一张最小数据边界表：
  - data name
  - config or runtime state
  - owner
  - reset rule
  - persistence rule
- 更新学习记录。

## 本课最小完成线

- 学员能区分 Resource 配置和运行时可变状态。
- 学员能说明共享 Resource 被误改的风险。
- 当前 default/easy 配置回归通过。
- 无红色 error。

## 导师证据锚点

- `godot/doc/classes/Resource.xml`
- `godot/doc/classes/ResourceLoader.xml`
- `godot/doc/classes/PackedScene.xml`
- `learning_kb/02_mentor/modules/M07_resource_loading_and_scene_instancing.md`
- `learning_kb/02_mentor/modules/M23_feedback_audio_and_data_driven_boundaries.md`
