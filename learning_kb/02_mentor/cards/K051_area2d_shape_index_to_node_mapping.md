# K051 - Area2D shape-entered indices can map back to shape nodes

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-18
Compatibility: unchanged

Conclusion:
- `body_shape_entered/area_shape_entered` 给出的 shape index 可用 `shape_find_owner` + `shape_owner_get_owner` 反查到具体 `CollisionShape2D` 节点。

Evidence:
- `godot/doc/classes/Area2D.xml` -> `body_shape_entered`, `area_shape_entered` 示例
- `godot/doc/classes/CollisionObject2D.xml` -> `shape_find_owner`, `shape_owner_get_owner`

Teaching Use:
- 用于多碰撞体角色的精细判定（头部/脚部/武器命中）。
