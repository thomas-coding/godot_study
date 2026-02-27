# K073 - tree_exited is the safe post-exit hook

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-27
Compatibility: unchanged

Conclusion:
- `tree_exited` 发生在节点退出树传播之后，适合做“确认离树后”的统计与联动（例如敌人死亡后清波判定）。

Evidence:
- `godot/doc/classes/Node.xml` -> `_exit_tree` / `tree_exited`
- `godot/scene/main/node.cpp` -> `Node::_propagate_exit_tree`, `Node::_propagate_after_exit_tree`

Teaching Use:
- 用于解释“为什么在死亡回调里立即判清波会误判”，并给出 `tree_exited` 作为稳定时序钩子。
