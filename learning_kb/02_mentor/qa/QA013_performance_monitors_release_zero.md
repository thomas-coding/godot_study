# QA013 - performance monitor values are zero in release

Question:
- 为什么我在导出 release 包后，某些 `Performance` 指标一直是 0？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 这是预期行为：`Performance` 部分内建监视器仅在 debug 可用，release 导出会固定返回 0。
- 需要线上观察时，建议加自定义 monitor 或写轻量日志采样。

Evidence:
- `godot/doc/classes/Performance.xml` -> 类说明（部分 monitor 在 release 始终 0）
- `godot/doc/classes/Performance.xml` -> `add_custom_monitor`
