# K080 - GDScript code delivery blocks must be copy-safe

Status: Working
Version Scope: 4.6
Last Verified: 2026-06-24
Compatibility: unchanged

Conclusion:
- 面向学员的 GDScript 代码块必须独立成段，并避免列表缩进、演示函数、额外前导空格污染复制结果；否则顶级 `func` 可能被粘贴进错误缩进层级。

Evidence:
- `learning_kb/03_sessions/session_protocol.md` -> `代码可复制性`
- `learning_kb/01_learner/daily_reports/2026-06-24.md`
- Project incident: learner pasted an explanatory `func example()` and got a parse error in `hud.gd`.

Teaching Use:
- 给代码时只给真实项目需要的块；若只是解释格式，用纯文字，不给可运行形态的示例函数。
- 用户已表示会自己处理复制缩进问题，不需要每次重复提示。
