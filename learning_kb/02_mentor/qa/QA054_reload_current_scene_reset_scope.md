# QA054 - What exactly does reload_current_scene reset?

Question:
- `reload_current_scene()` 会重置哪些内容，不会重置哪些内容？

Version Scope: 4.6
Last Verified: 2026-02-19
Compatibility: unchanged

Answer (teaching-ready):
- 会重置：当前场景实例及其节点局部状态（变量、节点树、运行时临时对象）。
- 不会自动重置：autoload 单例、引擎全局设置、进程级状态。
- 教学中可把它理解为“重新加载当前关卡”，而不是“重启整个应用”。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `current_scene`, `root`, `reload_current_scene`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::reload_current_scene`, `SceneTree::change_scene_to_node`
