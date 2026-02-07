# M04 - InputMap Action System

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-06
Compatibility: unchanged

## Core Conclusion

- `InputMap` 提供动作级输入抽象：动作可增删、可绑定多个事件，并可从 ProjectSettings 统一加载。

## Evidence

- Source: `godot/core/input/input_map.cpp`
  - 关键 API 绑定：`add_action` / `erase_action` / `action_add_event` / `event_is_action` / `load_from_project_settings`
  - 关键实现函数：
    - `InputMap::add_action`
    - `InputMap::action_add_event`
    - `InputMap::event_is_action`
    - `InputMap::load_from_project_settings`

## Teaching Use

- 回答“为什么建议用 action 而不是直接硬编码 keycode”。
- 排错“按键设置看起来正确但代码没反应”时，先查 action 名称和事件绑定，再做运行时验证。

## Fast Answer Snippet

- Action 是跨平台输入语义层，键位只是 action 的一种事件绑定；代码应优先查询 action，而不是直接查询具体按键。
