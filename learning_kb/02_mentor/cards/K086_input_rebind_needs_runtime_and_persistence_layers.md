# K086 - Input rebind needs runtime and persistence layers

Status: Working
Version Scope: 4.6
Last Verified: 2026-06-30
Compatibility: unchanged

Conclusion:
- Runtime `InputMap` changes and saved keybinding preferences are separate layers. A rebind UI is incomplete unless it updates runtime actions and persists the selected events to `user://`.

Evidence:
- `godot/doc/classes/InputMap.xml`
- `learning_kb/02_mentor/modules/M16_runtime_settings_application_audio_window_inputmap.md`
- `learning_kb/00_plan/lesson_26_2h_runbook.md`

Teaching Use:
- Use this in Lesson26 to explain why the existing keybinding entry can remain a placeholder until a real persistence flow is implemented.
