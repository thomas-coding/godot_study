# QA072 - Group count or manual counter for wave-clear detection?

Question:
- 做清波判定时，应该用组计数还是自己维护 `alive_enemy_count`？

Version Scope: 4.6
Last Verified: 2026-02-27
Compatibility: unchanged

Answer (teaching-ready):
- 课堂默认推荐组计数：`get_node_count_in_group("enemies") == 0`，实现更短且不易漏减。
- 当你有分波并发、同屏多阵营或性能极端优化需求时，再引入手写计数器；但要同步处理退出树时序。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `get_node_count_in_group`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::get_node_count_in_group`
- `godot/doc/classes/Node.xml` -> `add_to_group`
