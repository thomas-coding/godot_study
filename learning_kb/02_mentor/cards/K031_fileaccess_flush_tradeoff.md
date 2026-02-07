# K031 - FileAccess.flush trade-off

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- `FileAccess.flush()` 可提升崩溃时数据安全，但频繁调用会显著降低性能；应在关键持久化节点有节制使用。

Evidence:
- `godot/doc/classes/FileAccess.xml` -> `flush` 说明（safety vs performance）
- `godot/doc/classes/FileAccess.xml` -> process killed by F8 note

Teaching Use:
- 用于设计“自动保存频率与卡顿风险”的平衡策略。
