# QA050 - Area2D body_entered can receive TileMap

Question:
- 为什么 `body_entered` 有时收到的是 `TileMap`，不是 `PhysicsBody2D`？

Version Scope: 4.6
Last Verified: 2026-02-18
Compatibility: unchanged

Answer (teaching-ready):
- 这是文档定义行为：`body_entered` 的 body 可能是 `PhysicsBody2D` 或 `TileMap`。
- 只要 `TileMap` 的 `TileSet` 配了碰撞形状，就会被当作可检测体。
- 业务逻辑里应先判类型，再决定处理分支。

Evidence:
- `godot/doc/classes/Area2D.xml` -> `body_entered` 描述
