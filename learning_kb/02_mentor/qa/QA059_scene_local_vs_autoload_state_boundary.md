# QA059 - Should state live in scene-local script or autoload?

Question:
- 多关卡时，变量应该放 `Main` 脚本还是 AutoLoad 单例？

Version Scope: 4.6
Last Verified: 2026-02-22
Compatibility: unchanged

Answer (teaching-ready):
- 关卡内瞬时状态（如本关 coin 计数、临时门控）放场景本地脚本。
- 跨关卡连续状态（如累计得分、解锁进度）放 AutoLoad。
- 原因是 `root` 子节点可同时包含 `current_scene` 与 AutoLoad；切关会替换 `current_scene`，不会自动销毁 AutoLoad。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `root`, `current_scene`
- `godot/doc/classes/SceneTree.xml` -> `change_scene_to_file`, `reload_current_scene`
