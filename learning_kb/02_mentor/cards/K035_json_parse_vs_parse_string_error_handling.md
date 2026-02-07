# K035 - JSON.parse vs parse_string error handling

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- 需要健壮错误处理时优先 `JSON.parse()`，可读取 `get_error_message()`/`get_error_line()`；`JSON.parse_string()` 适合简写路径但失败返回 `null`。

Evidence:
- `godot/doc/classes/JSON.xml` -> `parse`, `parse_string`, `get_error_message`, `get_error_line`
- `godot/core/io/json.cpp` -> `JSON::parse` / `JSON::parse_string`

Teaching Use:
- 用于配置文件、网络回包等外部输入解析，避免“只知道失败但不知道失败位置”。
