# QA047 - Area2D body_entered not firing due to layer/mask mismatch

Question:
- 明明碰到了，为什么 `body_entered` 还是不触发？

Version Scope: 4.6
Last Verified: 2026-02-18
Compatibility: unchanged

Answer (teaching-ready):
- 先查层规则：`body.collision_layer` 必须命中 `area.collision_mask`。
- 再查 `Area2D.monitoring` 是否为 `true`。
- 新手排错可先把双方都放 layer 1，验证后再拆层。

Evidence:
- `godot/doc/classes/Area2D.xml` -> `body_entered`, overlap 检测说明
- `godot/doc/classes/CollisionObject2D.xml` -> `collision_layer`, `collision_mask`
- `godot/scene/2d/physics/collision_object_2d.cpp` -> `set_collision_layer`, `set_collision_mask`
