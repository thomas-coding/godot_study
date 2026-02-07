# QA034 - JSON parse diagnostics strategy

Question:
- 线上 JSON 解析失败时，应该用哪个 API 才能快速定位错误行？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 用实例方法 `JSON.parse()`，并读取 `get_error_message()` 与 `get_error_line()`。
- `JSON.parse_string()` 适合简写，但失败时只返回 `null`，不利于业务化错误处理。
- 配置/网络输入建议统一封装成 `parse + diagnostics` 路径。

Evidence:
- `godot/doc/classes/JSON.xml` -> `parse`, `parse_string`, `get_error_message`, `get_error_line`
- `godot/core/io/json.cpp` -> `JSON::parse`, `JSON::parse_string`
