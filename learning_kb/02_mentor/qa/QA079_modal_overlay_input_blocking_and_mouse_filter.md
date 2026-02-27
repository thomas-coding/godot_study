# QA079 - Why does modal overlay either block everything or let clicks pass through?

Question:
- 模态遮罩有时把按钮全挡住，有时又点穿到底层，应该怎么排查？

Version Scope: 4.6
Last Verified: 2026-02-27
Compatibility: unchanged

Answer (teaching-ready):
- 先看 `mouse_filter`：
  - 遮罩要拦截底层点击：`STOP` 或 `PASS`（结合层级）
  - 遮罩只做视觉不拦截：`IGNORE`
- 再看层级与可见性：
  - 模态层应在 HUD 顶层
  - 打开模态时隐藏易干扰文本，关闭时恢复

Evidence:
- `godot/doc/classes/Control.xml` -> `mouse_filter`, `MOUSE_FILTER_STOP`, `MOUSE_FILTER_PASS`, `MOUSE_FILTER_IGNORE`
