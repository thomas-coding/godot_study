# M11 - Signal Dispatch, GUI Input Propagation, and Pause-Aware Processing

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-08
Compatibility: unchanged

## Core Conclusion

- `Object.connect()` 默认不允许同一 signal/callable 重复连接；只有 `CONNECT_REFERENCE_COUNTED` 允许重复并以引用计数方式断开。
- `CONNECT_ONE_SHOT` 会在发射前先断开连接以避免递归重入；`CONNECT_DEFERRED` 则把回调放入 `MessageQueue` 在 idle 阶段执行。
- `set_block_signals(true)` 会让 `emit_signalp()` 直接返回，不再派发连接回调。
- UI 输入链路里，`Control::_call_gui_input()` 顺序是：`gui_input` signal -> `_gui_input` virtual -> `gui_input` 方法；任一步把输入标记为 handled 都会提前终止。
- `MOUSE_FILTER_STOP` 对指针类事件会在 `Viewport::_gui_call_input()` 中调用 `set_input_as_handled()`，从而阻断继续向上冒泡。
- 暂停态是否还能处理输入/process 由 `Node.process_mode` 决定，`Node::can_process()` 最终走 `_can_process(SceneTree.paused)` 分支判断。
- `SceneTree.create_timer()` 的 timer 更新总在节点处理之后；`process_in_physics=true` 时落在 physics 帧末。
- `set_process_input()/set_process_unhandled_input()` 本质是把节点加入或移出 `"_vp_*<viewport_id>"` 组，驱动 Viewport 的输入分发。

## Evidence

- Class docs: `godot/doc/classes/Object.xml`
  - `connect`（重复连接与 `CONNECT_REFERENCE_COUNTED`）
  - `CONNECT_DEFERRED`, `CONNECT_ONE_SHOT`, `CONNECT_REFERENCE_COUNTED`
  - `set_block_signals`
- Source: `godot/core/object/object.cpp`
  - `Object::connect`（duplicate + reference_count）
  - `Object::emit_signalp`（one-shot 预断开 + deferred push 到 `MessageQueue`）
  - `Object::_disconnect`
- Class docs: `godot/doc/classes/Control.xml`
  - `_gui_input`, `accept_event`
  - `MOUSE_FILTER_STOP/PASS/IGNORE`
- Source: `godot/scene/gui/control.cpp`
  - `Control::_call_gui_input`
  - `Control::accept_event`
- Source: `godot/scene/main/viewport.cpp`
  - `Viewport::_gui_call_input`
  - `Viewport::set_input_as_handled`
- Class docs: `godot/doc/classes/Node.xml`
  - `can_process`, `process_mode`
- Source: `godot/scene/main/node.cpp`
  - `Node::can_process`, `Node::_can_process`
  - `Node::set_process_input`, `Node::set_process_unhandled_input`
- Class docs: `godot/doc/classes/SceneTree.xml`
  - `create_timer`, `paused`
- Source: `godot/scene/main/scene_tree.cpp`
  - `SceneTree::process_timers`
  - `SceneTree::set_pause`

## Teaching Use

- 可作为“信号可靠派发 + UI 输入阻断 + pause 语义”一节的统一底层模型。
- 实战排错时先问三件事：
  1. 信号是即时还是 deferred？
  2. 输入是否在 Control 层已被 handled？
  3. 当前节点在 paused 下是否还能 process？

## Fast Answer Snippet

- 信号重复连接先看 `CONNECT_REFERENCE_COUNTED`，一次性触发看 `CONNECT_ONE_SHOT`，延迟派发看 `CONNECT_DEFERRED`；UI 事件没进 gameplay 先查 `mouse_filter + accept_event`；暂停态逻辑先查 `Node.process_mode`。
