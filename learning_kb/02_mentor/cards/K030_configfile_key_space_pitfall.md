# K030 - ConfigFile key naming space pitfall

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- `ConfigFile` 的 section/property 名不能包含空格；空格后的内容在存取时会被忽略，易造成“写入成功但读取异常”。

Evidence:
- `godot/doc/classes/ConfigFile.xml` -> class description（naming constraint）

Teaching Use:
- 用于排查配置键命名导致的数据错读问题。
