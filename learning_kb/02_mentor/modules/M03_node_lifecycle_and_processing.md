# M03 - Node Lifecycle and Processing

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-06
Compatibility: unchanged

## Core Conclusion

- `Node` 的生命周期遵循 enter-tree -> ready -> process/physics_process -> exit-tree；且在 `NOTIFICATION_READY` 阶段，如果脚本实现了 `_process` / `_physics_process`，引擎会自动开启对应处理开关。

## Evidence

- Source: `godot/scene/main/node.cpp`
  - 生命周期传播：`_propagate_enter_tree` / `_propagate_ready` / `_propagate_exit_tree`
  - READY 阶段自动启用：`NOTIFICATION_READY` 分支里 `set_process(true)` / `set_physics_process(true)`
  - 回调触发：`NOTIFICATION_PROCESS` -> `GDVIRTUAL_CALL(_process, ...)`
  - 回调触发：`NOTIFICATION_PHYSICS_PROCESS` -> `GDVIRTUAL_CALL(_physics_process, ...)`

## Teaching Use

- 回答“我没手动 `set_process(true)` 为什么 `_process` 还会执行？”
- 回答“节点何时 inside tree、何时 ready”时，解释 propagation 顺序。

## Fast Answer Snippet

- 在 Godot 中，脚本如果实现了 `_process`/`_physics_process`，通常在 READY 时会被自动注册到处理组，不一定需要你手动调用 `set_process(true)`。
