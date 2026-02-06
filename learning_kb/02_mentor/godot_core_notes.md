# Godot Core Notes

## Core Mental Model (Verified)

- Scene 是可复用的功能单元。
- Node 是运行时行为单元。
- SceneTree 是运行时组织与生命周期容器。
- Signal 是低耦合事件通信机制。
- Resource 用于数据承载与复用。

Source:
- https://docs.godotengine.org/en/stable/_sources/getting_started/introduction/key_concepts_overview.rst.txt
- https://docs.godotengine.org/en/stable/_sources/getting_started/step_by_step/nodes_and_scenes.rst.txt

## Runtime Loop (Verified / Partially)

- `_process(delta)`: 与渲染帧率相关，适合非物理逻辑。
- `_physics_process(delta)`: 固定步长节拍，适合物理相关逻辑。
- `delta`: 两次回调间的时间差，用于帧率无关计算。

Source:
- https://docs.godotengine.org/en/stable/_sources/getting_started/step_by_step/scripting_first_script.rst.txt
- `_physics_process(delta)` 的细节待补充官方段落引用

## To Verify (Planned)

- Godot 4.6 下 2D 项目默认物理步长设置位置与推荐值。
- InputMap 在桌面平台的默认行为细节（键位冲突、重复触发）。
- Camera2D 常见抖动问题的标准排查路径。

## Day 1 Practical Notes (Working)

- `Input.is_action_just_pressed("jump")` 在 Day 1 项目中已通过调试输出验证可用。
- 新手常见不确定点是“Input Map 是否真的生效”，可用最小脚本先验证再进入角色逻辑。

Evidence:
- `01_learner/daily_reports/2026-02-06.md`
