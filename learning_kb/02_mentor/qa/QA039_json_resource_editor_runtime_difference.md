# QA039 - JSON resource works in editor but fails in runtime

Question:
- 为什么同一个 JSON 资源在编辑器能打开，但运行时加载失败？

Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Answer (teaching-ready):
- 编辑器分支对 JSON 解析失败是“告警并允许继续打开”，便于修文件。
- 运行时分支会把解析错误当失败返回，资源加载中止。
- 所以发布前必须按运行时路径做 JSON 校验，不能只看编辑器可打开。

Evidence:
- `godot/core/io/json.cpp` -> `ResourceFormatLoaderJSON::load`
