# QA065 - Why doesn't a timer created inside timeout fire in the same frame?

Question:
- 我在 `timeout` 回调里马上又 `create_timer()`，为什么新 timer 不是同帧就开始？

Version Scope: 4.6
Last Verified: 2026-02-22
Compatibility: unchanged

Answer (teaching-ready):
- `process_timers()` 在开始遍历时会固定本轮末尾边界，本轮新加 timer 不参与当前遍历。
- 因此回调里新建 timer 会等下一轮 timer 处理（下一帧或下一 physics 帧）才生效。

Evidence:
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::process_timers` (`L = timers.back()` and break rule)
