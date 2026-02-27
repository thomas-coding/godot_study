# QA075 - When is the safe timing to unlock gate after the last enemy dies?

Question:
- 最后一只敌人死亡后，什么时候开门最稳，不会偶发漏开或早开？

Version Scope: 4.6
Last Verified: 2026-02-27
Compatibility: unchanged

Answer (teaching-ready):
- 推荐在敌人 `tree_exited`（或 deferred 检查）时再做判定：
  - `if get_tree().get_node_count_in_group("enemies") == 0: unlock_gate()`
- 这样能避开 `queue_free` 帧尾删除带来的同帧时序偏差。

Evidence:
- `godot/doc/classes/Node.xml` -> `tree_exited`, `queue_free`
- `godot/scene/main/node.cpp` -> `Node::_propagate_after_exit_tree`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::get_node_count_in_group`
