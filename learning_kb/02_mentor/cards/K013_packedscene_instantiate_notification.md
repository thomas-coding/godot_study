# K013 - PackedScene instantiate notification

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- `PackedScene.instantiate()` 成功后会在根节点发送 `Node.NOTIFICATION_SCENE_INSTANTIATED`；可作为“场景刚实例化完成”的钩子信号点。

Evidence:
- `godot/doc/classes/PackedScene.xml` -> `instantiate` 描述
- `godot/scene/resources/packed_scene.cpp` -> `PackedScene::instantiate`（`s->notification(Node::NOTIFICATION_SCENE_INSTANTIATED)`）

Teaching Use:
- 解释“实例化后初始化逻辑该挂在哪里”的生命周期问题。
