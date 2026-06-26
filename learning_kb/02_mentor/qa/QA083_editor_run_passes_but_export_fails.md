# QA083 - Why can the game run in the editor but fail after export?

Question:
- 为什么 Godot 编辑器里 `F5` 可以运行，但导出后的 Windows 包可能失败？

Version Scope: 4.6
Last Verified: 2026-06-26
Compatibility: unchanged

Answer (teaching-ready):
- 编辑器运行和导出包运行不是同一个验证面。导出后资源会进入打包/转换流程，运行时路径、导出模板、debug/release 形态、`user://` 目录和窗口行为都可能不同。
- 常见排查顺序：
  1. 先确认导出模板存在，`.exe` 能启动。
  2. 检查关键场景、贴图、Resource、PackedScene 是否实际出现在导出包中并能加载。
  3. 检查运行时加载是否使用稳定的 `res://` 路径。
  4. 检查存档/设置是否写到 `user://`，并重启验证。
  5. 用固定 playable route 做 smoke test，而不是只看首屏。

Evidence:
- `learning_kb/04_templates/windows_release_preflight_checklist.md`
- `learning_kb/04_templates/export_runtime_resource_loading_checklist.md`
- `godot/doc/classes/ResourceLoader.xml`
- `godot/doc/classes/PackedScene.xml`
- `godot/doc/classes/ProjectSettings.xml`
- `godot/doc/classes/OS.xml`
