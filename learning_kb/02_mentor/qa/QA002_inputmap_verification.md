# QA002 - InputMap Verification

Question:
- Input Map 看起来配好了，怎么快速确认真的生效？

Version Scope: 4.6
Last Verified: 2026-02-06
Compatibility: unchanged

Answer (teaching-ready):
- 先检查 action 名拼写，再用最小脚本做运行时验证：
  - `if Input.is_action_just_pressed("jump"): print("jump OK")`
- 若输出正常，说明 action 绑定链路是通的，再继续角色逻辑。

Evidence:
- `godot/core/input/input_map.cpp` -> `event_is_action`
- `01_learner/daily_reports/2026-02-06.md`
