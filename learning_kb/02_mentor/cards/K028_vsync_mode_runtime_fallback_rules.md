# K028 - runtime V-Sync fallback rules

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- 运行时设置 V-Sync 时，若平台/渲染器不支持目标模式，引擎会回退到 `VSYNC_ENABLED`；Compatibility 渲染器对高级模式支持受限。

Evidence:
- `godot/doc/classes/DisplayServer.xml` -> `window_set_vsync_mode`（fallback note）
- `godot/doc/classes/DisplayServer.xml` -> V-Sync mode notes（Compatibility behavior）

Teaching Use:
- 解释“我设置 Adaptive/Mailbox 但行为像 Enabled”的平台兼容问题。
