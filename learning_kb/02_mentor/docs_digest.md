# Docs Digest

> 规则：每次教学前后补充 1-2 条，记录“读了什么 -> 结论是什么 -> 来源在哪里”。

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
  - `info.txt`

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

## Next Reading Queue

1. Getting Started -> Introduction to Godot
2. Step by Step -> Nodes and Scenes
3. Step by Step -> Scripting languages
4. Your first 2D game -> 01~03
5. Manual -> Best practices -> Project organization
