# 第23课 - 2h Runbook（Windows 导出干跑 + 发布前最小验证）

目标：在 2 小时内完成一次 Windows 导出干跑，验证导出包能启动、资源能加载、核心流程能运行，并留下发布前最小检查记录。

## 本课唯一目标（英文）

`Today I will export a Windows test build and run a small release preflight check on the playable slice.`

## 时间切片（120 分钟）

## 0-10 min: 启动检查

- 打开并确认：
  - `learning_kb/01_learner/current_state.md`
  - `learning_kb/01_learner/gap_backlog.md`
- 运行项目：确认第22课 alpha 小切片基线可用。
- 快速回归：
  - start
  - pause/resume
  - restart
  - collect/goal
  - event/wave
  - Boss/reward/result panel
  - scene transition

## 10-25 min: 检查导出环境

- 打开 Godot Export 面板。
- 检查是否已有 Windows Desktop export preset。
- 检查 export templates 是否安装。
- 若模板缺失：
  - 记录为课堂阻塞项。
  - 不临时改教学目标为 Steam 发布。
  - 本课退化为“导出配置检查 + preflight 清单演练”。

## 25-40 min: 建立 Windows 测试导出预设

- 新建或检查 Windows Desktop preset：
  - Target: Windows Desktop
  - Export Path: 项目外或 `builds/windows_test/first_game.exe`
  - Export With Debug: 课堂默认打开，便于日志排错
  - Export Filter: 先使用导出全部项目资源
- 记录导出配置：
  - Godot version
  - preset name
  - debug/release mode
  - export path
  - 是否嵌入 PCK

## 40-60 min: 执行第一次导出

- 执行 Export Project。
- 若导出成功：
  - 记录生成文件路径。
  - 不直接宣布发布可用，只进入测试。
- 若导出失败：
  - 记录第一条错误。
  - 按 P0/P1/P2 分类。
  - 只修复阻塞导出的最小配置问题。

## 60-85 min: 运行导出包 smoke test

- 直接运行导出的 `.exe`。
- 观察窗口启动、主场景加载、资源显示。
- 执行最小路线：
  1. 冷启动进入主场景
  2. `Enter` 开始
  3. 移动/跳跃
  4. 收集 coin
  5. 触发事件/波次
  6. Boss 或结果链路关键点
  7. `P` 暂停/恢复
  8. `R` 重开
- 记录：
  - 是否有黑屏/崩溃
  - 是否有资源缺失
  - 输入是否正常
  - `user://` 存档/设置是否仍能读写

## 85-100 min: 导出包资源与状态核查

- 检查运行时资源加载风险：
  - 场景、贴图、脚本均能加载。
  - `PackedScene` 实例化对象仍能出现。
  - `Resource` 配置仍生效。
- 检查存档/设置：
  - `SaveManager` 不因导出环境失败。
  - 音量/窗口设置能保存并重启后恢复。
- 检查构建身份：
  - 记录是否为 debug template。
  - 若已接入日志，可打印 `OS.has_feature("template")` 与 `OS.is_debug_build()`。

## 100-110 min: 建立导出干跑记录

- 在学习库或项目记录中写入本次 dry run：
  - 日期
  - Godot baseline
  - 导出 preset
  - 生成路径
  - 测试路线
  - 结果：pass/fail
  - P0/P1/P2 问题列表
- 若通过：
  - 标记为 first Windows dry run pass。
- 若失败：
  - 写清下次第一修复点。

## 110-120 min: 收尾沉淀

- 更新：`learning_kb/01_learner/daily_reports/YYYY-MM-DD.md`
- 更新：`learning_kb/01_learner/current_state.md`
- 更新：`learning_kb/01_learner/mastery_map.md` / `learning_kb/01_learner/gap_backlog.md`
- 更新：`learning_kb/03_sessions/handoff_latest.md`

## 本课最小完成线

- 有一个 Windows export preset，或明确记录缺失 export templates 的阻塞原因。
- 若可导出：生成 `.exe` 并能启动。
- 导出包完成一条 playable smoke test 路线。
- 关键资源、输入、重开、存档/设置无 P0 问题。
- 输出一份导出干跑记录和后续修复列表。

## 导师证据锚点

- `godot/doc/classes/EditorExportPlatformPC.xml`：Windows/Linux/macOS PC 导出平台入口与官方 Windows 导出链接。
- `godot/doc/classes/EditorExportPlatform.xml`：导出模板定位、默认导出模板命令行参数。
- `godot/editor/export/project_export.cpp`：Export 对话框中的 preset、export filter、export project、template missing 提示等编辑器链路。
- `godot/doc/classes/OS.xml`：`has_feature()`、`is_debug_build()`、`get_user_data_dir()`。
- `godot/doc/classes/ResourceLoader.xml`：导出包资源加载与缓存/线程加载语义。
- `godot/doc/classes/PackedScene.xml`：可实例化场景检查。
- `godot/doc/classes/ProjectSettings.xml`：导出期资源转换与窗口/运行配置。
- `learning_kb/04_templates/windows_release_preflight_checklist.md`
- `learning_kb/04_templates/export_runtime_resource_loading_checklist.md`
