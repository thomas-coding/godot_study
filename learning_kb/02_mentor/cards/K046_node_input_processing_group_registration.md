# K046 - Input processing toggles map to Viewport input groups

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-08
Compatibility: unchanged

Conclusion:
- `set_process_input` / `set_process_unhandled_input` 的启停会把节点加入或移出 `"_vp_input<id>"`、`"_vp_unhandled_input<id>"` 等组，驱动输入分发。

Evidence:
- `godot/scene/main/node.cpp` -> `Node::set_process_input`, `Node::set_process_unhandled_input`, `Node::set_process_unhandled_key_input`

Teaching Use:
- 用于解释“动态开关输入监听后为什么立刻生效/失效”。
