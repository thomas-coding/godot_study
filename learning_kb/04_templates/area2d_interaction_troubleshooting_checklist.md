# Area2D Interaction Troubleshooting Checklist (Godot 4.6)

用途：Day3 可收集物/触发器实作时，按顺序排查信号不触发、层级不匹配、回收时序问题。

## 0) Baseline checks

- 引擎版本：确认为 `Godot 4.6 stable`。
- 触发节点类型：应为 `Area2D`，且包含 `CollisionShape2D`。
- 进入者类型：通常为 `CharacterBody2D`（或其他 `PhysicsBody2D`）。

## 1) Monitoring checks

- `Area2D.monitoring` 是否为 `true`。
- 若是 Area 对 Area 检测，目标 `Area2D.monitorable` 也要为 `true`。
- 代码里不要在 in/out 回调里直接改 monitoring/monitorable，需 `set_deferred`。

## 2) Layer/mask checks

- 检查触发规则：对象 A 想检测 B，必须 `B.collision_layer` 命中 `A.collision_mask`。
- 新手阶段建议先用同一层（例如 layer 1）排除配置噪声。
- 逐层拆分时改用 `set_collision_layer_value` / `set_collision_mask_value`，避免位掩码写错。

## 3) Signal and timing checks

- `body_entered` 比 `get_overlapping_bodies()` 更适合做实时触发。
- overlap 列表按物理步更新，不是对象移动后立刻更新。
- 若要定位具体碰撞子形状，用 `body_shape_entered` + `shape_find_owner`。

## 4) Removal checks

- 收集物回收优先 `queue_free()`，避免在当前逻辑栈中强制 `free()`。
- 若要“立刻不可见”，可先隐藏/禁监控，再 `queue_free()`。
- 复查是否重复连接信号导致多次回调。

## 5) Typical symptom mapping

- 症状：碰到了但没触发
  - 检查点：`monitoring`、层/掩码、`CollisionShape2D` 是否存在。
- 症状：刚移动后 overlap 查询不准
  - 检查点：是否误用 `get_overlapping_*` 期待“即时结果”。
- 症状：回调里改监控状态报错
  - 检查点：改为 `set_deferred("monitoring", false)`。

## Evidence anchors

- `godot/doc/classes/Area2D.xml`
- `godot/doc/classes/CollisionObject2D.xml`
- `godot/doc/classes/Node.xml`
- `godot/scene/2d/physics/area_2d.cpp`
- `godot/scene/2d/physics/collision_object_2d.cpp`
- `godot/scene/main/scene_tree.cpp`
