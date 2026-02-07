# K018 - Performance monitor visibility in debug/release

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- `Performance` 部分内建监视器只在 debug 可用；release 导出时这些指标会返回 0。

Evidence:
- `godot/doc/classes/Performance.xml` -> 类说明（debug-only monitors and release zero）
- `godot/doc/classes/Performance.xml` -> `OBJECT_ORPHAN_NODE_COUNT` 说明（debug-only 示例）

Teaching Use:
- 指导线上性能观测时补充自定义 monitor 或日志采样，不依赖 debug-only 指标。
