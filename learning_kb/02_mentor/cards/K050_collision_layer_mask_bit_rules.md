# K050 - Collision layer/mask uses bit rules (1-32)

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-18
Compatibility: unchanged

Conclusion:
- `collision_layer`/`collision_mask` 是 1~32 的位掩码规则；`set_collision_*_value(layer_number, value)` 底层是位运算。

Evidence:
- `godot/doc/classes/CollisionObject2D.xml` -> `collision_layer`, `collision_mask`
- `godot/scene/2d/physics/collision_object_2d.cpp` -> `set_collision_layer_value`, `set_collision_mask_value`

Teaching Use:
- 用于解释“碰撞体明明重叠却不触发”的层级配置原因。
