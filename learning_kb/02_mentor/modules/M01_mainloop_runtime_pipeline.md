# M01 - Main Loop Runtime Pipeline

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-06
Compatibility: unchanged

## Core Conclusion

- Godot 启动后会创建 `MainLoop`（默认是 `SceneTree`），并在 `Main::iteration()` 中按“物理 -> 常规 process -> 渲染 -> 音频/脚本 frame”推进一帧。

## Evidence

- Source: `godot/main/main.cpp`
  - `MainLoop` 创建与设置：`Main::start()` 附近（`main_loop = memnew(SceneTree)` / `OS::set_main_loop`）
  - 主循环入口：`bool Main::iteration()`
  - 物理阶段：`get_main_loop()->physics_process(...)`
  - 常规阶段：`get_main_loop()->process(...)`
  - 渲染阶段：`RenderingServer::draw(...)`

## Teaching Use

- 回答“为什么 `_physics_process` 和 `_process` 要分开”时，先讲这条全局流水线。
- 回答“某逻辑该放哪”时：
  - 与物理一致性强（碰撞、地面检测、速度积分）优先放 physics。
  - 视觉/UI/非物理逻辑优先放 process。

## Fast Answer Snippet

- `_physics_process` 发生在主循环的物理子步中，`_process` 在每帧常规更新阶段，二者处在不同时间语义的阶段。
