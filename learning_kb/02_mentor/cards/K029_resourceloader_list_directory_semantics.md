# K029 - ResourceLoader.list_directory semantics

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- `ResourceLoader.list_directory()` 返回资源和子目录（目录名带 `/`），资源文件名是导出前编辑器可见原名；返回顺序不保证稳定。

Evidence:
- `godot/doc/classes/ResourceLoader.xml` -> `list_directory` 描述

Teaching Use:
- 用于构建运行时资源索引时，提醒“先归一化 + 排序”再驱动逻辑。
