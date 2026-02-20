# M13 - Input Dispatch Order, Pause Gates, and Scene Reload Semantics

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-19
Compatibility: unchanged

## Core Conclusion

- 输入事件的主链路是：`_input -> Control._gui_input -> _shortcut_input -> _unhandled_key_input -> _unhandled_input`，前序若标记 handled，后续阶段不会再执行。
- `_unhandled_input` 适合玩法热键（如 pause/restart），因为 GUI 有更高优先级可先拦截。
- `SceneTree._call_input_pause` 分发输入时会先检查 `Node.can_process()`；节点是否能处理输入与 `SceneTree.paused + Node.process_mode` 组合有关。
- `PROCESS_MODE_INHERIT` 会继承父节点；若父节点是 `ALWAYS`，子节点可能“暂停不停更”。
- `SceneTree.paused=true` 会停 2D/3D physics，且 `PAUSABLE` 节点停止 `_process/_physics_process/_input` 回调。
- `reload_current_scene()` 通过当前场景文件路径重载场景实例：场景内状态会重建，autoload 不会被自动重置。

## Evidence

- Class docs: `godot/doc/classes/Viewport.xml`
  - `push_input` 传播顺序
  - `set_input_as_handled` 阻断后续传播
- Source: `godot/scene/main/viewport.cpp`
  - `Viewport::push_input`
  - `Viewport::_push_unhandled_input_internal`
  - `Viewport::set_input_as_handled`
- Class docs: `godot/doc/classes/Node.xml`
  - `_unhandled_input` 语义
  - `can_process`
  - `process_mode` 与 `PROCESS_MODE_*`
  - `_ready` 子先父后
- Source: `godot/scene/main/node.cpp`
  - `Node::can_process`
  - `Node::_can_process`
  - `Node::set_process_unhandled_input`
- Class docs: `godot/doc/classes/SceneTree.xml`
  - `paused`
  - `reload_current_scene`
- Source: `godot/scene/main/scene_tree.cpp`
  - `SceneTree::_call_input_pause`
  - `SceneTree::set_pause`
  - `SceneTree::reload_current_scene`
  - `SceneTree::change_scene_to_file`

## Teaching Use

- 用于第4课讲清三个高频坑：
  1. 为什么 `P` 显示暂停但玩家还在动（`INHERIT -> ALWAYS`）。
  2. 为什么多个节点会同时响应同一热键（未标记 handled）。
  3. 为什么 `R` 重开后场景重置但全局单例数据不重置（作用域差异）。
- 课堂推荐顺序：先画输入链路，再讲 pause gate，再讲 reload 作用域。

## Fast Answer Snippet

- 热键优先放 `_unhandled_input`；若重复触发，用 `set_input_as_handled` 或集中路由；暂停是否生效看 `process_mode` 继承链；`reload_current_scene` 重建当前场景，不重置 autoload。
