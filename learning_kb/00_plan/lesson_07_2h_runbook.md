# 第7课 - 2h Runbook（Camera2D 跟随 + 抖动排查）

目标：在 2 小时内让相机稳定跟随玩家，并能用最小排错方法定位常见抖动问题。

## 本课唯一目标（英文）

`Today I will add a stable Camera2D follow setup and verify jitter-free movement in gameplay.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行项目：确认第6课结果可用（start/play + hazard/goal + restart/pause）。

## 10-35 min: 增加 Camera2D

- 在 `Player` 场景下新增 `Camera2D` 子节点。
- 打开 `Current`（或 Godot 4 对应 `Enabled`）使其成为当前相机。
- 先关闭平滑，验证“纯跟随”行为。

## 35-65 min: 跟随稳定化

- 观察玩家移动/跳跃时画面是否抖动。
- 若需要，开启 position smoothing，并小步调整速度。
- 保持相机更新节奏与玩家移动逻辑一致（优先物理节奏）。

## 65-90 min: 抖动诊断

- 使用排错清单：
  - `learning_kb/04_templates/camera2d_follow_jitter_checklist.md`
- 重点检查：
  1. 相机与角色更新时机是否错位
  2. 是否混用不同回调导致延迟观感
  3. 是否存在像素对齐/平滑参数冲突

## 90-105 min: 体验与边界

- 选择是否增加简单边界限制（防止相机跑出关卡可视范围）。
- 仅做最小配置，不引入复杂关卡系统。

## 105-120 min: 收尾沉淀

- 更新：`learning_kb/01_learner/daily_reports/YYYY-MM-DD.md`
- 更新：`learning_kb/01_learner/current_state.md`
- 更新：`learning_kb/01_learner/mastery_map.md` / `learning_kb/01_learner/gap_backlog.md`
- 更新：`learning_kb/03_sessions/handoff_latest.md`

## 本课最小完成线

- 相机能稳定跟随玩家移动/跳跃。
- 无明显抖动（或已定位原因并有明确修复路径）。
- 不影响现有 start/pause/restart/collect 流程。
