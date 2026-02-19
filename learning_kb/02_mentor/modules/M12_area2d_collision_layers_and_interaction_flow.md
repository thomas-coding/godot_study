# M12 - Area2D Interaction Flow, Layer/Mask Gates, and Safe Removal Timing

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-18
Compatibility: unchanged

## Core Conclusion

- `Area2D` 的 overlap 列表（`get_overlapping_*`）不是即时更新，而是按物理步统一刷新；实时触发优先使用 `body_entered/area_entered` 信号。
- `Area2D` 检测成立需要层级匹配：被检测对象的 `collision_layer` 必须命中检测者的 `collision_mask`。
- `monitoring` 控制“我是否检测别人”，`monitorable` 控制“我是否可被其他 Area 检测”。
- 在 in/out 回调中直接切 `monitoring/monitorable` 会被引擎阻止，需使用 `set_deferred`。
- `body_entered` 的 `body` 不只可能是 `PhysicsBody2D`，也可能是带碰撞的 `TileMap`。
- 交互回收默认使用 `queue_free()`：对象在帧尾删除，避免当前调用栈中的立即释放风险。

## Evidence

- Class docs: `godot/doc/classes/Area2D.xml`
  - `get_overlapping_bodies/get_overlapping_areas`（按 physics step 刷新）
  - `overlaps_body/overlaps_area`（非即时结果提示）
  - `body_entered/body_shape_entered/area_entered`
  - `monitoring`, `monitorable`
- Source: `godot/scene/2d/physics/area_2d.cpp`
  - `Area2D::set_monitoring`
  - `Area2D::set_monitorable`
  - `Area2D::get_overlapping_bodies`
  - `Area2D::get_overlapping_areas`
  - in/out 回调内 `locked` 保护与 `set_deferred` 错误提示
- Class docs: `godot/doc/classes/CollisionObject2D.xml`
  - `collision_layer`, `collision_mask` 规则
  - `input_pickable`
- Source: `godot/scene/2d/physics/collision_object_2d.cpp`
  - `CollisionObject2D::set_collision_layer`
  - `CollisionObject2D::set_collision_mask`
  - `set_collision_layer_value` / `set_collision_mask_value`
- Class docs: `godot/doc/classes/Node.xml`
  - `queue_free`
- Source: `godot/scene/main/scene_tree.cpp`
  - `SceneTree::queue_delete`
  - `SceneTree::_flush_delete_queue`

## Teaching Use

- Day3 可直接用该模块讲清“触发器为什么不触发”的排错主线：
  1. 先看 `monitoring/monitorable`
  2. 再看 layer/mask
  3. 再看信号连接与时序
- 讲授“视觉节点”和“碰撞节点”解耦后，再引入 `Area2D` 交互，不容易混淆。

## Fast Answer Snippet

- `Area2D` 信号触发问题优先排查 `monitoring + layer/mask`；overlap API 不是即时读数；回调里改监控状态要用 `set_deferred`；收集物回收优先 `queue_free`。
