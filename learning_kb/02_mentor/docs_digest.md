# Docs Digest

> 规则：每次教学前后补充 1-2 条，记录“读了什么 -> 结论是什么 -> 来源在哪里”。

## 2026-02-07

- Topic: 知识库版本化治理落地（Working）
- Summary:
  - 新增版本注册表、迁移协议、兼容矩阵三件套，支持长期跨版本维护。
  - 触发词“更新知识库到godot X.Y”已接入启动协议与会话协议。
  - 现有模块/卡片/问答已补充版本字段，后续可按矩阵做增量迁移。
- Source:
  - `AGENTS.md`
  - `00_meta/version_registry.md`
  - `00_meta/version_upgrade_protocol.md`
  - `02_mentor/indexes/version_matrix.md`

## 2026-02-06

- Topic: 文档入口结构与学习路径梳理
- Summary:
  - 稳定版文档包含 Getting Started、Step by Step、First 2D Game 等完整新手路径。
  - 对当前目标（从零到可发布）应先走 2D 基础，再进入导出与发布链路。
- Source:
  - https://docs.godotengine.org/en/stable/

- Topic: 本地项目信息确认
- Summary:
  - 当前工作目录已包含 Godot 4.6-stable 源码副本。
  - 可同时进行“引擎学习（源码）”和“游戏开发学习（编辑器）”两条线。
- Source:
  - `godot/version.py`
  - `godot` 仓库当前提交标签：`4.6-stable`

- Topic: Godot 四大核心概念（Verified）
- Summary:
  - Godot 游戏可抽象为节点树；核心概念是 Scenes / Nodes / Scene Tree / Signals。
  - Signals 用于低耦合事件通信，避免硬编码依赖。
- Source:
  - https://docs.godotengine.org/en/stable/_sources/getting_started/introduction/key_concepts_overview.rst.txt

- Topic: Nodes vs Scenes 与 Main Scene（Verified）
- Summary:
  - 节点是基础构件，场景是节点树的可复用封装。
  - 项目运行依赖 main scene（F5），单场景调试可用 current scene（F6）。
- Source:
  - https://docs.godotengine.org/en/stable/_sources/getting_started/step_by_step/nodes_and_scenes.rst.txt

- Topic: 脚本语言选择基线（Verified）
- Summary:
  - 新手推荐先用 GDScript（与编辑器集成最好，学习资料最多）。
  - C# 适合已有经验者；C++ 可通过 GDExtension 做高性能扩展，不建议首日就上。
- Source:
  - https://docs.godotengine.org/en/stable/_sources/getting_started/step_by_step/scripting_languages.rst.txt

- Topic: _process(delta) 与帧率无关更新（Verified）
- Summary:
  - `_process(delta)` 每帧回调，`delta` 是上一帧到当前帧时间差。
  - 位置/旋转更新应乘 delta，避免帧率依赖。
- Source:
  - https://docs.godotengine.org/en/stable/_sources/getting_started/step_by_step/scripting_first_script.rst.txt

- Topic: 首作从 2D 开始的官方建议（Verified）
- Summary:
  - 官方明确建议新手先 2D，再转 3D。
  - `Your first 2D game` 是完整入门路径，可作为本阶段主教程线。
- Source:
  - https://docs.godotengine.org/en/stable/_sources/getting_started/first_2d_game/index.rst.txt

- Topic: Day 1 实作验证（Working）
- Summary:
  - 学员已完成安装与项目运行，`F5` 可启动 `first_game`。
  - Input actions `move_left` / `move_right` / `jump` 已创建。
  - 通过调试脚本验证 `Input.is_action_just_pressed("jump")` 生效。
- Source:
  - `01_learner/daily_reports/2026-02-06.md`

- Topic: 长期会话继承架构（Working）
- Summary:
  - 已建立快照优先的恢复链路：handoff -> current_state -> knowledge_map。
  - 目标是应对多年规模数据增长，避免每次会话全量扫描。
- Source:
  - `00_meta/kb_architecture.md`
  - `03_sessions/handoff_latest.md`

- Topic: 导师知识扩展路线（Working）
- Summary:
  - 已补充图形学基础路线和引擎深潜路线，后续按阶段逐步填充可验证内容。
- Source:
  - `02_mentor/graphics_foundations.md`
  - `02_mentor/engine_deep_dive_plan.md`

- Topic: 引擎主循环源码链路（Verified）
- Summary:
  - `Main::start()` 会创建并设置 `MainLoop`（默认 `SceneTree`）。
  - `Main::iteration()` 每帧推进 physics/process/render，形成回调执行的时间语义。
- Source:
  - `godot/main/main.cpp` (`Main::start`, `Main::iteration`)

- Topic: SceneTree 帧内管线（Verified）
- Summary:
  - `SceneTree::physics_process` / `SceneTree::process` 都会处理消息队列、timer/tween、删除队列。
  - 这解释了很多“延后到帧末生效”的行为（如 queue_free）。
- Source:
  - `godot/scene/main/scene_tree.cpp` (`physics_process`, `process`, `process_timers`, `process_tweens`)

- Topic: Node 生命周期与自动 process 注册（Verified）
- Summary:
  - READY 通知阶段会根据脚本是否重写 `_process`/`_physics_process` 自动调用 `set_process`/`set_physics_process`。
  - 生命周期传播链：enter_tree -> ready -> exit_tree。
- Source:
  - `godot/scene/main/node.cpp` (`NOTIFICATION_READY`, `_propagate_enter_tree`, `_propagate_ready`, `_propagate_exit_tree`)

- Topic: InputMap/CharacterBody2D 核心 API 定位（Verified）
- Summary:
  - InputMap 核心接口：`add_action`, `action_add_event`, `event_is_action`, `load_from_project_settings`。
  - CharacterBody2D 运动核心：`move_and_slide`, `velocity`, `is_on_floor`。
- Source:
  - `godot/core/input/input_map.cpp`
  - `godot/scene/2d/physics/character_body_2d.cpp`

- Topic: 长期导师知识库结构升级（Working）
- Summary:
  - 新增 `indexes/ modules/ cards/ qa/` 四层结构，支持多年扩展与快速检索。
  - 新增“学习下godot”触发协议，保证新 AI 直接进入导师学习模式。
- Source:
  - `00_meta/mentor_knowledge_schema.md`
  - `02_mentor/expert_study_protocol.md`
  - `AGENTS.md`

## Next Reading Queue

1. Getting Started -> Introduction to Godot
2. Step by Step -> Nodes and Scenes
3. Step by Step -> Scripting languages
4. Your first 2D game -> 01~03
5. Manual -> Best practices -> Project organization

## Next Reading Queue (Expert Track)

1. `godot/doc/classes/CharacterBody2D.xml`
2. `godot/doc/classes/Node.xml`
3. `godot/doc/classes/SceneTree.xml`
4. `godot/core/input/input_map.cpp` 深读事件匹配细节
5. `godot/scene/2d/physics/character_body_2d.cpp` 运动求解细节
