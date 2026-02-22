# QA064 - How should we set timers under bullet-time (time_scale)?

Question:
- 做子弹时间时，哪些计时器该跟随 `Engine.time_scale`，哪些不该？

Version Scope: 4.6
Last Verified: 2026-02-22
Compatibility: unchanged

Answer (teaching-ready):
- 玩法节奏相关（技能 CD、敌人攻速）通常应跟随 `time_scale`，保持“慢动作下全局都变慢”。
- UI 或系统超时（倒计时提示、网络超时）常用 `ignore_time_scale=true`，保持真实时间感。
- 关键是先定义“这是世界时间还是真实时间”。

Evidence:
- `godot/doc/classes/SceneTree.xml` -> `create_timer(ignore_time_scale)`
- `godot/doc/classes/Engine.xml` -> `time_scale` affects SceneTreeTimer
- `godot/scene/main/scene_tree.cpp` -> `process_timers` delta branch
