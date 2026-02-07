# QA040 - JSON keep_text and save behavior

Question:
- `JSON.parse(..., keep_text=true)` 对后续保存有什么实际影响？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 开启 `keep_text` 后，可通过 `get_parsed_text()` 保留原始文本副本。
- JSON 资源保存时会优先写回这份 parsed_text；没有时才会 `stringify` 新文本。
- 这有助于减少格式漂移，但也要注意不要把错误文本长期保留。

Evidence:
- `godot/doc/classes/JSON.xml` -> `parse(keep_text)`, `get_parsed_text`
- `godot/core/io/json.cpp` -> `ResourceFormatSaverJSON::save`
