# QA032 - Group call order with reverse flag

Question:
- 如何让组调用按“反向节点顺序”执行，避免父子顺序导致的问题？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 使用 `GROUP_CALL_REVERSE`。
- 若还要避免卡顿，可再加 `GROUP_CALL_DEFERRED`，让调用进入帧尾消息队列。
- 常见组合：`GROUP_CALL_DEFERRED | GROUP_CALL_REVERSE`。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `call_group_flags` 示例
- `godot/scene/main/scene_tree.cpp` -> reverse 分支与 `MessageQueue::push_callp`
