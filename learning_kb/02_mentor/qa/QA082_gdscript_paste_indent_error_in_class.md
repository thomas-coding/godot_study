# QA082 - Why does copied GDScript from class produce indentation errors?

Question:
- 为什么课堂里复制的 GDScript 代码粘贴到 Godot 后会因为缩进报错？

Version Scope: 4.6
Last Verified: 2026-06-24
Compatibility: unchanged

Answer (teaching-ready):
- GDScript 使用缩进表达代码块，顶级 `func` 必须在脚本顶层缩进。
- 聊天界面、Markdown 列表或引用块可能在复制时给每一行加前导空格，导致 `func` 被放进错误层级。
- 这类问题优先按“复制格式污染”处理，不要先怀疑业务逻辑。
- 教学交付规则：
  - 代码块独立成段。
  - 不在编号列表缩进里放代码。
  - 不给会被误复制的演示函数。
  - 明确“替换整个函数”或“插入到哪个同级位置”。

Evidence:
- `learning_kb/03_sessions/session_protocol.md` -> `代码可复制性`
- `learning_kb/01_learner/daily_reports/2026-06-24.md`
- `projects/first-game/scenes/hud.gd` classroom incident
