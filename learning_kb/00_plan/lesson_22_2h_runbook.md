# 第22课 - 2h Runbook（可玩关卡整合与小型 alpha 回归）

目标：在 2 小时内把当前 vertical slice 整合成可连续游玩的 alpha 小切片，并建立最小回归清单，避免后续新增内容破坏核心流程。

## 本课唯一目标（英文）

`Today I will integrate the playable level chain and run a small alpha regression pass with a clear fix list.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行项目：确认第21课 Boss reward、Goal 解锁归属和 HUD 短提示基线可用。
- 快速回归：
  - start
  - pause/resume
  - restart
  - collect/goal
  - event trigger
  - wave/Boss/reward/result panel

## 10-25 min: 定义 alpha 小切片范围

- 固定本轮 alpha 范围：
  1. 至少 2 个可进入的关卡
  2. 每关有明确开始、过程、结束
  3. 至少 1 个事件触发点
  4. 至少 1 个敌人/波次/Boss 互动
  5. 可重开且无红色报错
- 明确不做内容：
  - 不做完整美术打磨
  - 不做 Steam 发布
  - 不做复杂存档迁移

## 25-45 min: 整理关卡链路

- 检查每个关卡的 `next_level_scene_path`：
  - `Level 1 -> Level 2`
  - `Level 2 -> Level 3`（如存在）
  - 终关 `next_level_scene_path` 为空或进入明确结算场景
- 检查每关的 `unlock_level_on_win`。
- 禁止 loopback 误配：
  - 终关不能误指回上一关，除非本课明确做循环模式。
- 验收：
  - 从第一关开始能按预期切到下一关。
  - `R` 始终只重开当前关。

## 45-70 min: 建立 alpha 回归清单

- 建立最小检查表，建议写入项目内或学习库：
  - 运行入口：`F5`
  - Start gate：Enter 后进入 PLAYING
  - Movement：移动/跳跃正常
  - Collectible：收集后计数更新
  - Goal gate：未满足目标不能通关，满足后可通关
  - Event trigger：一次性事件有效，重开恢复
  - Wave/Boss：敌人生成、伤害、清空/击败逻辑有效
  - Reward/result：奖励只发一次，Boss reward 短提示显示，Goal 仍负责通关
  - Pause：P 暂停/恢复不破坏 UI
  - Restart：R 重开恢复场景本地状态
  - Scene transition：切关不污染上一关状态
  - Output/Debugger：无红色 error

## 70-95 min: 执行 alpha 回归并记录问题

- 按固定路线执行：
  1. 新开游戏
  2. 完成第一关目标
  3. 触发事件/波次
  4. 进入下一关
  5. 触发 Boss 或终局流程
  6. 重开当前关再测一次关键路径
- 记录每个问题：
  - 编号
  - 复现步骤
  - 期望结果
  - 实际结果
  - 优先级：`P0/P1/P2`
- P0 定义：
  - 阻止继续游玩
  - 红色报错
  - 无法重开
  - 无法通关

## 95-110 min: 最小修复

- 只修 P0 或高影响 P1。
- 修复策略：
  - 优先配置错误修复
  - 其次脚本空值保护
  - 最后才做结构性改动
- 每修一个问题，必须回归它影响的最小路径。
- 不做无关重构。

## 110-120 min: 收尾沉淀

- 更新：`learning_kb/01_learner/daily_reports/YYYY-MM-DD.md`
- 更新：`learning_kb/01_learner/current_state.md`
- 更新：`learning_kb/01_learner/mastery_map.md` / `learning_kb/01_learner/gap_backlog.md`
- 更新：`learning_kb/03_sessions/handoff_latest.md`

## 本课最小完成线

- 至少 1 条从开始到结束的可玩路线通过。
- 有一份可重复执行的 alpha 回归清单。
- P0 问题清零，或明确记录阻塞原因与下一步。
- `R` 重开、`P` 暂停、切关、事件/敌人/Boss/奖励主链路无红色报错。

## 导师证据锚点

- `godot/doc/classes/SceneTree.xml`：`reload_current_scene`、`change_scene_to_file`、`scene_changed` 与场景切换/重开语义。
- `godot/doc/classes/Node.xml`：场景树生命周期、`_ready` 顺序、节点组、`queue_free` 重置边界。
- `godot/doc/classes/PackedScene.xml`：场景实例化与可复用关卡/对象模板。
- `02_mentor/automated_regression_spec_v1.md`：回归记录结构、执行配置与结果留档。
- `04_templates/windows_release_preflight_checklist.md`：后续发布前检查可复用项。
