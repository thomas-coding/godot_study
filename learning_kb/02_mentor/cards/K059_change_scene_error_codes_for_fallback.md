# K059 - change_scene_to_file error codes support explicit fallback

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-22
Compatibility: unchanged

Conclusion:
- `change_scene_to_file` 可返回 `ERR_CANT_OPEN/ERR_CANT_CREATE`，应据此做日志与回退，而不是默认切换必成功。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `change_scene_to_file`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::change_scene_to_file`, `SceneTree::change_scene_to_packed`

Teaching Use:
- 课堂里可直接示范“路径错误”导致切换失败，并训练学员做最小容错。
