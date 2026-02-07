# QA028 - ConfigFile key with spaces issue

Question:
- 我在 `ConfigFile` 用了带空格的 section/key，为什么读出来不对？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- `ConfigFile` 的 section/property 名不能包含空格。
- 空格后的内容会在保存/读取时被忽略，导致你看到“写入成功但读取错位”。
- 规范做法：统一用下划线或点号命名键。

Evidence:
- `godot/doc/classes/ConfigFile.xml` -> naming constraint note
