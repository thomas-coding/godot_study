# K072 - get_node_count_in_group returns 0 when group is missing

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-27
Compatibility: unchanged

Conclusion:
- `SceneTree.get_node_count_in_group(group)` 在组不存在时返回 `0`，可直接用于“清波后开门”的最小判定。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `get_node_count_in_group`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::get_node_count_in_group`

Teaching Use:
- 用于第19课“敌人全清判定”教学，减少手写计数器与漏减问题。
