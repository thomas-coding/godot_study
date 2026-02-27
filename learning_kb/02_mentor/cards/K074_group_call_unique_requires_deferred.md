# K074 - GROUP_CALL_UNIQUE deduplicates only with DEFERRED

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-27
Compatibility: unchanged

Conclusion:
- `GROUP_CALL_UNIQUE` 只有在与 `GROUP_CALL_DEFERRED` 同时使用时才会进入去重路径；单独使用 `UNIQUE` 不会触发 unique 缓存逻辑。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `call_group_flags`, `GROUP_CALL_UNIQUE`, `GROUP_CALL_DEFERRED`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::call_group_flagsp`

Teaching Use:
- 用于课堂解释“组调用去重为什么没生效”的常见误区。
