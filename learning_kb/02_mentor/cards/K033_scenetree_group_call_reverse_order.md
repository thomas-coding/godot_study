# K033 - SceneTree GROUP_CALL_REVERSE order semantics

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- `GROUP_CALL_REVERSE` 会按组内节点顺序反向执行；常用于父后子先或从尾到头处理的批量逻辑。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `call_group_flags` + `GROUP_CALL_REVERSE`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::call_group_flagsp` / `notify_group_flags`（reverse for-loop）

Teaching Use:
- 用于修复批量停用/隐藏时的时序抖动，尤其是树结构依赖明显的节点组。
