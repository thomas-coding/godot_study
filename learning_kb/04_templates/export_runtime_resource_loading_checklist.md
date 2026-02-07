# Export Runtime Resource Loading Checklist (Godot 4.6)

用途：解决“编辑器可加载、导出后失败/行为不同”的资源加载问题。

## 0) Baseline

- 确认测试包类型：debug template / release template。
- 打印 `OS.is_debug_build()` 与关键 `OS.has_feature(...)` 标签。

## 1) Path and resource type checks

- 运行时 `load` 路径是否使用 `res://` 绝对路径。
- 是否把非资源文件误用 `ResourceLoader` 读取（应使用 `FileAccess`）。
- 场景资源使用 `PackedScene` 并确认 `can_instantiate()`。

## 2) Export settings checks

- 核查 `ProjectSettings.editor/export/convert_text_resources_to_binary`。
- 若依赖运行时文本资源加载，确认导出策略与编辑器一致。
- 对关键资源做“导出包内实际加载”回归，不只在编辑器验证。

## 3) Cache and threaded loading checks

- 检查是否因缓存复用导致“资源改了但运行中没变化”（`CACHE_MODE_REUSE` 默认）。
- 线程加载路径先 `load_threaded_get_status()` 再 `load_threaded_get()`。

## 4) Final validation

- 在目标导出平台做一次全路径 smoke test（菜单 -> 场景切换 -> 返回）。
- 记录失败资源路径、加载状态、feature tag，写入回归清单。

## Evidence anchors

- `godot/doc/classes/ResourceLoader.xml`
- `godot/doc/classes/PackedScene.xml`
- `godot/doc/classes/ProjectSettings.xml`
- `godot/doc/classes/OS.xml`
