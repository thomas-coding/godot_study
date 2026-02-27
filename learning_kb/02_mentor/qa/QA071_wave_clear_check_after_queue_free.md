# QA071 - Why does wave-clear check fail right after enemy death callback?

Question:
- 为什么我在敌人死亡回调里立刻判断“敌人是否清空”，有时门不会开？

Version Scope: 4.6
Last Verified: 2026-02-27
Compatibility: unchanged

Answer (teaching-ready):
- 常见原因是你在同帧里过早判断了。`queue_free()` 是帧尾删除，敌人节点在本帧后段才真正离树。
- 稳定做法：把“清波判定”放到 `tree_exited` 信号，或使用 deferred 检查后再判 `get_node_count_in_group("enemies") == 0`。

Evidence:
- `godot/doc/classes/Node.xml` -> `queue_free`
- `godot/scene/main/node.cpp` -> `Node::_propagate_exit_tree`, `Node::_propagate_after_exit_tree`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::get_node_count_in_group`
