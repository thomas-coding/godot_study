# K032 - SceneTree GROUP_CALL_UNIQUE requires deferred

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- `GROUP_CALL_UNIQUE` 必须与 `GROUP_CALL_DEFERRED` 组合才生效；否则不会进入 unique 去重路径。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `GROUP_CALL_UNIQUE` 说明（must be combined with deferred）
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::call_group_flagsp`（`if (GROUP_CALL_UNIQUE && GROUP_CALL_DEFERRED)` 分支）

Teaching Use:
- 用于解释“同帧多次触发同组调用却只执行一次”的正确配置方式。
