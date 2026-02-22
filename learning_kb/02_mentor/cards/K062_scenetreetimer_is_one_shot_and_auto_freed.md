# K062 - SceneTreeTimer is one-shot and auto-freed by default

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-22
Compatibility: unchanged

Conclusion:
- `SceneTreeTimer` 是一次性计时器，到时发 `timeout` 后会被解除引用并自动释放；需要延长生命周期时应主动保留引用。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `create_timer`
- `godot/doc/classes/SceneTreeTimer.xml` -> description (dereferenced after time elapses)

Teaching Use:
- 用于解释“为什么 timer 到点后对象不在了，二次 await 失败”。
