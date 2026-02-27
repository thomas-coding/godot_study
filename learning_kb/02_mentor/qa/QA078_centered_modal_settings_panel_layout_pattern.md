# QA078 - How to build a centered modal settings panel that scales on different resolutions?

Question:
- 设置面板怎样做成“居中弹窗 + 全屏遮罩”，并且在不同分辨率下都稳定？

Version Scope: 4.6
Last Verified: 2026-02-27
Compatibility: unchanged

Answer (teaching-ready):
- 推荐结构：`SettingsPanel(Control full-rect)` -> `Panel(centered)` -> `VBoxContainer(content)`。
- 关键点：
  - 根遮罩使用 `PRESET_FULL_RECT` 贴满父层
  - 内容容器使用 `SIZE_EXPAND_FILL` 与最小尺寸
  - 交互控件（Slider/OptionButton）保证最小可点击高度

Evidence:
- `godot/doc/classes/Control.xml` -> `PRESET_FULL_RECT`, `size_flags_horizontal`, `size_flags_vertical`, `SIZE_EXPAND_FILL`
