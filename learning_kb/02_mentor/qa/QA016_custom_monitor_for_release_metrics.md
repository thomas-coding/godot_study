# QA016 - custom monitor for release metrics

Question:
- release 包里部分 `Performance` 指标是 0，我如何持续拿到可用性能数据？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 先承认限制：部分内建 monitor 是 debug-only，在 release 会返回 0。
- 解决方案：用 `Performance.add_custom_monitor()` 挂你自己的业务指标（如敌人数、子弹数、关键系统耗时）。
- 建议保留“内建 monitor + custom monitor + 轻量日志”三层观测，方便线上回溯。

Evidence:
- `godot/doc/classes/Performance.xml` -> debug/release 说明
- `godot/doc/classes/Performance.xml` -> `add_custom_monitor`
