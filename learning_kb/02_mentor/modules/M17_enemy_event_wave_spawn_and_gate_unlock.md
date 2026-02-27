# M17 - Enemy-event linkage for wave spawn and gate unlock

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-27
Compatibility: unchanged

## Core Conclusion

- 敌人波次刷新建议统一走“事件入口 -> `PackedScene.instantiate()` -> `add_child()` -> `add_to_group("enemies")`”链路，减少分散刷怪点。
- 清波判定优先用 `SceneTree.get_node_count_in_group("enemies") == 0`，比手写计数器更稳，且不存在组时直接返回 `0`。
- 不要依赖组内顺序：`Node.add_to_group` 文档明确组顺序不保证；`get_nodes_in_group` 返回按树序的快照，主要用于遍历，不用于稳定排序语义。
- 同帧销毁时序要防误判：`queue_free` 是帧尾删除，若在敌人死亡回调里立即判清波可能偏早；可在 `tree_exited` 或 deferred 检查后开门。
- 若使用组广播触发联动，`GROUP_CALL_UNIQUE` 只有和 `GROUP_CALL_DEFERRED` 同时使用才会去重。

## Evidence

- Class docs:
  - `godot/doc/classes/PackedScene.xml`
    - `instantiate`
  - `godot/doc/classes/SceneTree.xml`
    - `get_nodes_in_group`
    - `get_node_count_in_group`
    - `call_group_flags`
  - `godot/doc/classes/Node.xml`
    - `add_to_group`
    - `_exit_tree` / `tree_exited`
    - `queue_free`
- Source:
  - `godot/scene/resources/packed_scene.cpp`
    - `PackedScene::instantiate`
  - `godot/scene/main/scene_tree.cpp`
    - `SceneTree::call_group_flagsp`
    - `SceneTree::_get_nodes_in_group`
    - `SceneTree::get_node_count_in_group`
  - `godot/scene/main/node.cpp`
    - `Node::add_to_group`
    - `Node::remove_from_group`
    - `Node::_propagate_exit_tree`
    - `Node::_propagate_after_exit_tree`

## Teaching Use

- 第19课课堂口径：
  1. 刷怪入口统一（事件触发，不在多处散落实例化）。
  2. 清波判定统一（组计数归零才开门）。
  3. 时序保护统一（`queue_free` 帧尾 + `tree_exited/deferred` 再判定）。
- 最小排错顺序：
  1. 触发器是否只触发一次（`wave_started`/`triggered_event_ids`）。
  2. 敌人是否都进了 `enemies` 组。
  3. 开门判定是否放在离树后的时机。
  4. 重开后状态是否重置（波次、门控、触发器）。

## Fast Answer Snippet

- 第19课建议用“事件统一刷怪 + 组计数清波 + 离树后开门”三段式：`instantiate/add_child` 负责生成，`get_node_count_in_group("enemies")` 负责清波，`tree_exited` 或 deferred 检查负责稳定解锁。
