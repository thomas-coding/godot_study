# QA049 - Getting exact shape node from body_shape_entered

Question:
- `body_shape_entered` 里拿到的是 shape index，怎么定位到具体 `CollisionShape2D`？

Version Scope: 4.6
Last Verified: 2026-02-18
Compatibility: unchanged

Answer (teaching-ready):
- 用 index 先找 owner，再从 owner 拿节点：
  - `owner_id = body.shape_find_owner(body_shape_index)`
  - `shape_node = body.shape_owner_get_owner(owner_id)`
- 本地 `Area2D` 的 shape index 同理可反查。

Evidence:
- `godot/doc/classes/Area2D.xml` -> `body_shape_entered` 示例
- `godot/doc/classes/CollisionObject2D.xml` -> `shape_find_owner`, `shape_owner_get_owner`
