# K077 - Fullscreen sets borderless true on enter

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-27
Compatibility: unchanged

Conclusion:
- `window_set_mode` 进入全屏时会强制 `borderless=true`，退出全屏后若希望恢复边框，需要显式再设置。

Evidence:
- `godot/doc/classes/DisplayServer.xml` -> `window_set_mode`, `window_set_flag`, `WindowMode`

Teaching Use:
- 用于课堂讲解“全屏切回窗口后样式变化”的预期行为与恢复策略。
