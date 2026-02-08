# QA042 - CONNECT_DEFERRED vs call_deferred

Question:
- 我应该用 `CONNECT_DEFERRED` 还是 `call_deferred()` 做延迟执行？

Version Scope: 4.6
Last Verified: 2026-02-08
Compatibility: unchanged

Answer (teaching-ready):
- `CONNECT_DEFERRED` 是“信号连接级”的延迟，适合把某个信号回调统一挪到 idle 阶段。
- `call_deferred()` 是“单次方法调用级”的延迟，适合局部绕开当前栈/时序风险。
- 要“下一帧只执行一次”的明确语义，可以用 `process_frame.connect(callable, CONNECT_ONE_SHOT)`。

Evidence:
- `godot/doc/classes/Object.xml` -> `call_deferred` note, `CONNECT_DEFERRED`, `CONNECT_ONE_SHOT`
- `godot/core/object/object.cpp` -> `Object::emit_signalp` deferred path
