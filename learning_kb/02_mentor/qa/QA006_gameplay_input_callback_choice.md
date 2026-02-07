# QA006 - gameplay input callback choice

Question:
- 做角色控制时，应该用 `_input` 还是 `_unhandled_input` / `_unhandled_key_input`？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 默认建议：Gameplay 输入优先 `_unhandled_input` 或 `_unhandled_key_input`，让 GUI 有更高优先级先消费事件。
- `_input` 适合通用输入监听，但容易和 UI 抢事件。
- 实战中可用“事件采样 + 物理执行”分层：输入回调里更新意图状态，在 `_physics_process` 里应用移动/跳跃。

Evidence:
- `godot/doc/classes/Node.xml` -> `_input` 描述（gameplay 场景通常更推荐 unhandled）
- `godot/doc/classes/Node.xml` -> `_unhandled_input` / `_unhandled_key_input` 描述
- `godot/main/main.cpp` -> `Main::iteration`（physics 与 process 分阶段执行）
