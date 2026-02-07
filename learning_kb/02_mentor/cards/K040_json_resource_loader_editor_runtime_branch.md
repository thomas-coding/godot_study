# K040 - JSON resource loader differs in editor/runtime on parse error

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- JSON 资源解析失败时，编辑器模式会告警但允许继续打开；运行时模式会返回错误并中止加载。

Evidence:
- `godot/core/io/json.cpp` -> `ResourceFormatLoaderJSON::load`（`Engine::is_editor_hint()` 分支）

Teaching Use:
- 用于解释“编辑器能打开但导出运行失败”的 JSON 资源差异行为。
