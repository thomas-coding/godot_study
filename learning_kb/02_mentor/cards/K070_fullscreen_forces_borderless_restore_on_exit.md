# K070 - Fullscreen forces borderless and may need explicit restore

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-25
Compatibility: unchanged

Conclusion:
- 使用 `DisplayServer.window_set_mode(FULLSCREEN/EXCLUSIVE_FULLSCREEN)` 时会强制窗口无边框；退出全屏后如果希望恢复边框需显式设置。

Evidence:
- `godot/doc/classes/DisplayServer.xml` -> `window_set_mode` note (fullscreen forces borderless)

Teaching Use:
- 用于解释“退出全屏后窗口外观不一致”的课堂常见问题。
