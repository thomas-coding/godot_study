# K003 - InputMap and Project Settings

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-06
Compatibility: unchanged

Conclusion:
- InputMap 支持从 ProjectSettings 加载动作配置，动作查询应优先使用 action 名而非硬编码按键。

Evidence:
- `godot/core/input/input_map.cpp` -> `load_from_project_settings`, `event_is_action`

Teaching Use:
- 输入排错时先检查 action 名、事件绑定，再做运行时 print 验证。
