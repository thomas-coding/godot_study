# QA001 - _process vs _physics_process

Question:
- `_process(delta)` 和 `_physics_process(delta)` 到底怎么选？

Version Scope: 4.6
Last Verified: 2026-02-06
Compatibility: unchanged

Answer (teaching-ready):
- `_physics_process` 运行在固定物理节拍，更适合碰撞、重力、速度积分等需要稳定步长的逻辑。
- `_process` 跟渲染帧走，更适合 UI、镜头特效、非物理动画与通用每帧逻辑。

Evidence:
- `godot/main/main.cpp` -> `Main::iteration()`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::physics_process` / `SceneTree::process`
