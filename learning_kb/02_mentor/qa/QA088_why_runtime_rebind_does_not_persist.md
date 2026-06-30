# QA088 - Why does runtime key rebinding not persist automatically?

Question:
- 为什么运行时改了 `InputMap`，重启后按键不会自动保留？

Version Scope: 4.6
Last Verified: 2026-06-30
Compatibility: unchanged

Answer (teaching-ready):
- `InputMap` 的运行时修改只影响当前进程中的动作映射。
- 项目默认输入来自 Project Settings；玩家自己的改键需要另存到 `user://`，下次启动时再读回来应用。
- 因此真实改键系统至少有两层：
  1. runtime apply：修改当前 `InputMap`。
  2. persistence：保存并恢复玩家选择。

Evidence:
- `godot/doc/classes/InputMap.xml`
- `learning_kb/02_mentor/cards/K086_input_rebind_needs_runtime_and_persistence_layers.md`
- `learning_kb/00_plan/lesson_26_2h_runbook.md`

Validation:
- 改一次按键，重启项目；若没有保存层，映射会回到项目默认值。
