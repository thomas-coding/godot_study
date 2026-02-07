# K024 - ConfigFile changes need explicit save

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- `ConfigFile.set_value()` 等修改只在内存生效；要持久化到磁盘必须显式调用 `save`/`save_encrypted`/`save_encrypted_pass`。

Evidence:
- `godot/doc/classes/ConfigFile.xml` -> 类说明（mutations are in-memory until save）

Teaching Use:
- 解释“设置改了但重启丢失”的保存流程问题。
