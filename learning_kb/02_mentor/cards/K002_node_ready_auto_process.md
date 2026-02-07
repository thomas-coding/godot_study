# K002 - Node READY Auto Processing

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-06
Compatibility: unchanged

Conclusion:
- 脚本实现 `_process` 或 `_physics_process` 时，Node 在 READY 通知阶段会自动启用对应处理开关。

Evidence:
- `godot/scene/main/node.cpp` -> `NOTIFICATION_READY` 分支

Teaching Use:
- 解释“我没 set_process 但回调仍执行”的常见疑问。
