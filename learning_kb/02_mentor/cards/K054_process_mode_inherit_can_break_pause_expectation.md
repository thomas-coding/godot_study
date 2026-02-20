# K054 - PROCESS_MODE_INHERIT may break pause expectation via parent ALWAYS

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-19
Compatibility: unchanged

Conclusion:
- 节点默认 `PROCESS_MODE_INHERIT`，若父节点设为 `ALWAYS`，子节点会继承并在暂停时继续处理，导致“看起来 paused 了但角色还在动”。

Evidence:
- `godot/doc/classes/Node.xml` -> `process_mode`, `can_process`, `PROCESS_MODE_*`
- `godot/scene/main/node.cpp` -> `Node::_can_process`

Teaching Use:
- 第4课 pause 排错第一检查项：先看继承链，不要只看当前节点脚本。
