# QA003 - F5 Run Flow

Question:
- 按 F5 后 Godot 实际做了什么？

Version Scope: 4.6
Last Verified: 2026-02-06
Compatibility: unchanged

Answer (teaching-ready):
- F5 走“Run Project”路径，使用项目的 `main scene` 启动。
- 引擎会建立 `MainLoop`（默认 `SceneTree`），然后进入每帧迭代：physics -> process -> render。

Evidence:
- `godot/main/main.cpp` -> `Main::start`, `Main::iteration`
- docs: Nodes/Scenes（main scene 概念）
