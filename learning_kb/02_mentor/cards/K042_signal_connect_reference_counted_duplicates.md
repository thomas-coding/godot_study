# K042 - CONNECT_REFERENCE_COUNTED allows duplicate signal connections

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-08
Compatibility: unchanged

Conclusion:
- 同一 signal/callable 默认只能连一次；若使用 `CONNECT_REFERENCE_COUNTED` 可重复连接，断开时按引用计数递减。

Evidence:
- `godot/doc/classes/Object.xml` -> `connect`, `CONNECT_REFERENCE_COUNTED`
- `godot/core/object/object.cpp` -> `Object::connect`, `Object::_disconnect`

Teaching Use:
- 用于排查“重复 connect 报错”与“为什么 disconnect 一次还在触发”。
