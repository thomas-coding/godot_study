# K061 - root contains current_scene and autoload siblings

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-22
Compatibility: unchanged

Conclusion:
- `SceneTree.root` 始终存在，其子节点可同时包含 `current_scene` 与 AutoLoad；因此跨关卡状态建议放 AutoLoad，关卡瞬时状态放场景本地。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `root`, `current_scene`

Teaching Use:
- 用于解释“为什么场景重开会清关卡变量，但全局单例不自动清零”。
