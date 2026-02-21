# 第13课 - 2h Runbook（存档与设置基础：ConfigFile）

目标：在 2 小时内完成最小可用的本地持久化流程，让关键数据在重开游戏后仍可恢复。

## 本课唯一目标（英文）

`Today I will implement a minimal ConfigFile-based save/load flow for progress and settings persistence.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行项目：确认第12课两关切换基线可用。

## 10-35 min: 建立 SaveManager 基线

- 新建 `save_manager.gd`（推荐 autoload）。
- 定义最小存储项：
  - `best_score`
  - `audio_volume`
  - `unlocked_level`
- 采用 `ConfigFile` 读写 `user://save.cfg`。

## 35-65 min: 写入时机与加载时机

- 写入：
  - 通关后刷新 `unlocked_level`
  - 分数刷新后更新 `best_score`
  - 设置变化后更新 `audio_volume`
- 读取：
  - 游戏启动时加载存档
  - Main/HUD 初始化时应用读取结果

## 65-90 min: 容错与默认值

- 文件不存在时安全创建默认值。
- 字段缺失时回退默认值，不阻塞游戏运行。
- 打印关键加载结果，便于排错。

## 90-105 min: 回归验证

- 验证：
  1. 改设置并重开，值能恢复
  2. 刷新 best score 并重开，值能恢复
  3. 解锁关卡并重开，解锁状态保留

## 105-120 min: 收尾沉淀

- 更新：`learning_kb/01_learner/daily_reports/YYYY-MM-DD.md`
- 更新：`learning_kb/01_learner/current_state.md`
- 更新：`learning_kb/01_learner/mastery_map.md` / `learning_kb/01_learner/gap_backlog.md`
- 更新：`learning_kb/03_sessions/handoff_latest.md`

## 本课最小完成线

- 完成 `ConfigFile` 的读取/写入闭环。
- 至少 2 类数据可稳定持久化。
- 无红色报错。
