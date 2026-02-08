# QA041 - Duplicate signal connection error and reference-counted mode

Question:
- 为什么同一个信号重复 `connect()` 会报错？什么时候该用 `CONNECT_REFERENCE_COUNTED`？

Version Scope: 4.6
Last Verified: 2026-02-08
Compatibility: unchanged

Answer (teaching-ready):
- 默认同一 signal/callable 只能连接一次，重复连接会返回 `ERR_INVALID_PARAMETER`。
- 若业务上确实需要“可重复订阅”，使用 `CONNECT_REFERENCE_COUNTED`，这样每次 `disconnect` 只减计数，减到 0 才真正断开。
- 常规 gameplay 推荐先 `is_connected()` 再连接，避免隐式重复。

Evidence:
- `godot/doc/classes/Object.xml` -> `connect`, `CONNECT_REFERENCE_COUNTED`
- `godot/core/object/object.cpp` -> `Object::connect`, `Object::_disconnect`
