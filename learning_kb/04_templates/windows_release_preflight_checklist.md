# Windows Release Preflight Checklist (Godot 4.6)

用途：发布前做最小可执行回归，降低“编辑器正常、导出异常”风险。

## 0) Build identity

- 启动后记录：`OS.has_feature("template")` 与 `OS.is_debug_build()`。
- 确认目标包确实是预期构建（template debug / template release）。

## 1) Boot and scene flow

- 冷启动到主菜单无报错。
- 主流程场景切换（start -> play -> restart -> return）全部可达。
- 关键 `PackedScene` 资源可 `can_instantiate()` 且实例化成功。

## 2) Runtime resource loading

- 运行时 `load` 路径全部为 `res://` 绝对路径。
- 线程加载路径遵守：`load_threaded_request` -> `load_threaded_get_status` -> `load_threaded_get`。
- 核查 `editor/export/convert_text_resources_to_binary` 与项目加载策略一致。

## 3) Save and runtime state

- `user://` 存档写入、读取、重启后恢复均正常。
- 关键设置项（音量、分辨率、键位）在导出包可持久化。

## 4) Input and focus

- 键鼠核心输入路径可用（移动/跳跃/确认/返回）。
- Alt-Tab 后恢复焦点，输入与暂停状态正确。

## 5) Performance sanity

- 固定 3 段场景各跑 30 秒，记录 FPS 与关键帧时间。
- 检查是否存在显著峰值卡顿（加载、战斗高峰、场景切换）。
- 注意 release 下部分内建 monitor 可能为 0，必要时用 custom monitor。

## 6) Frame pacing

- 记录 `display/window/vsync/vsync_mode`、`max_fps`、显示器刷新率。
- 核对 FPS cap 是否符合预期（考虑 V-Sync 优先级）。

## 7) Final gate

- 无阻断崩溃/黑屏/资源缺失。
- 关键功能回归通过并留档（构建号 + 日期 + 执行人 + 结果）。

## Evidence anchors

- `godot/doc/classes/OS.xml`
- `godot/doc/classes/ResourceLoader.xml`
- `godot/doc/classes/PackedScene.xml`
- `godot/doc/classes/ProjectSettings.xml`
- `godot/doc/classes/Engine.xml`
- `godot/doc/classes/DisplayServer.xml`
