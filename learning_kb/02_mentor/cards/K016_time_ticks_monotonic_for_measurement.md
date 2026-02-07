# K016 - Time ticks are monotonic for measurement

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- 做精确耗时统计优先用 `Time.get_ticks_usec()` / `get_ticks_msec()`（单调时钟），不要用系统时间方法做性能测量。

Evidence:
- `godot/doc/classes/Time.xml` -> 类说明（性能计时建议）
- `godot/doc/classes/Time.xml` -> `get_ticks_usec`, `get_ticks_msec`

Teaching Use:
- 用于构建可重复的性能采样代码模板，减少“时间跳变”误判。
