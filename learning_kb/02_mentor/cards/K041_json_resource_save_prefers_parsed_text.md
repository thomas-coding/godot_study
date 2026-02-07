# K041 - JSON resource save prefers parsed_text when available

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- JSON 资源保存时若 `get_parsed_text()` 非空，会优先回写原解析文本；否则才基于 `data` 做 `JSON.stringify()`。

Evidence:
- `godot/doc/classes/JSON.xml` -> `parse(keep_text)` 与 `get_parsed_text`
- `godot/core/io/json.cpp` -> `ResourceFormatSaverJSON::save`

Teaching Use:
- 用于设计“配置文件尽量保留原格式”的存储策略。
