# Godot Engine Deep Dive Plan

目标：在不影响主线开发的前提下，逐步建立“会用引擎”到“理解引擎”的桥梁。

## Track A (Immediate, supports gameplay coding)

- Scene/Node runtime lifecycle
- Input event flow and action mapping
- Physics update timing (`_physics_process`)

## Track B (Mid-term, supports architecture decisions)

- Resource loading path and scene instancing behavior
- Script lifecycle and object ownership basics

## Track C (Long-term, supports optimization and debugging)

- Rendering and server architecture overview
- Performance profiling and bottleneck classification

## Working Rule

- 任何 deep dive 结论必须回流到当前项目可执行决策。
- 若与当前阶段无关，只做轻量记录，不占用主学习时长。
