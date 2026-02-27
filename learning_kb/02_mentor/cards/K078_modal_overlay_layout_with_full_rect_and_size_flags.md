# K078 - Modal overlay layout uses full-rect preset and size flags

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-27
Compatibility: unchanged

Conclusion:
- 模态层稳定做法是：遮罩节点 `PRESET_FULL_RECT` 贴满父控件，内容容器用 `size_flags` 控制扩展与最小尺寸，配合 `mouse_filter` 明确输入拦截策略。

Evidence:
- `godot/doc/classes/Control.xml` -> `PRESET_FULL_RECT`, `size_flags_horizontal`, `size_flags_vertical`, `mouse_filter`

Teaching Use:
- 作为设置面板、暂停菜单、结算弹窗的统一布局模板，降低 UI 遮挡和点击穿透问题。
