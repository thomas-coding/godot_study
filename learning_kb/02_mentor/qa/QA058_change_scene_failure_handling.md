# QA058 - How should we handle change_scene failures?

Question:
- `change_scene_to_file()` 失败时，课堂项目应该怎么做最小容错？

Version Scope: 4.6
Last Verified: 2026-02-22
Compatibility: unchanged

Answer (teaching-ready):
- 不要假设切换必成功，先接收返回值 `Error`。
- `ERR_CANT_OPEN` 常见于路径错误或资源未打包；`ERR_CANT_CREATE` 常见于实例化失败。
- 课堂最小方案：打印错误码 + 保持当前场景 + 给 HUD 提示“切换失败，可重试”。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `change_scene_to_file`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::change_scene_to_file`, `SceneTree::change_scene_to_packed`
