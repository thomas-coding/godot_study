# K043 - CONNECT_ONE_SHOT and CONNECT_DEFERRED dispatch behavior

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-08
Compatibility: unchanged

Conclusion:
- `CONNECT_ONE_SHOT` 在 signal 发射时会先断开再调用，避免递归重入；`CONNECT_DEFERRED` 通过 `MessageQueue::push_callablep` 在 idle 阶段执行。

Evidence:
- `godot/doc/classes/Object.xml` -> `CONNECT_ONE_SHOT`, `CONNECT_DEFERRED`
- `godot/core/object/object.cpp` -> `Object::emit_signalp`

Teaching Use:
- 用于解释“同帧回调时序异常”与“one-shot 为什么不会连环触发”。
