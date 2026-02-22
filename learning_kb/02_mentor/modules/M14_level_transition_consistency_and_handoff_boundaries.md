# M14 - Level Transition Consistency and Handoff Boundaries

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-22
Compatibility: unchanged

## Core Conclusion

- `change_scene_to_file()` 的底层路径是 `load -> change_scene_to_packed -> change_scene_to_node`，返回码可区分“加载失败”和“实例化失败”。
- 场景切换是两阶段：旧场景先从树上移除，然后在帧末提交新场景；这段窗口内 `current_scene` 可能为 `null`。
- 需要稳定拿到新场景时，优先使用 `scene_changed` 作为同步点，而不是在 `change_scene_*` 调用后立刻访问。
- `reload_current_scene()` 通过 `current_scene.get_scene_file_path()` 回到同一路径，天然符合“重开当前关卡”语义。
- `SceneTree.root` 的子节点同时可包含 `current_scene` 与 AutoLoad 单例：关卡内瞬时状态放场景本地，跨关卡状态放 AutoLoad。

## Evidence

- Class docs: `godot/doc/classes/SceneTree.xml`
  - `change_scene_to_file`（返回 `OK/ERR_CANT_OPEN/ERR_CANT_CREATE`）
  - `change_scene_to_node`（旧场景立即移除 + 帧末提交新场景 + `current_scene` 暂时为 `null`）
  - `scene_changed`（新场景加入并初始化后发信号）
  - `reload_current_scene`
  - `root`（`current_scene` 与 AutoLoad 均为 root 子节点）
- Source: `godot/scene/main/scene_tree.cpp`
  - `SceneTree::change_scene_to_file`
  - `SceneTree::change_scene_to_packed`
  - `SceneTree::change_scene_to_node`
  - `SceneTree::_flush_scene_change`（提交 `current_scene` 并 `emit_signal("scene_changed")`）
  - `SceneTree::reload_current_scene`

## Teaching Use

- 用于第12课（Level 1 -> Level 2）固定课堂口径：
  1. 先讲“切换两阶段 + 空窗期”避免误判。
  2. 再讲“`scene_changed` 是稳定锚点”。
  3. 最后讲“场景本地状态 vs AutoLoad 跨关状态边界”。
- 课堂验收建议强制包含失败路径：`change_scene_*` 返回非 `OK` 时给出日志与回退行为。

## Fast Answer Snippet

- 多关卡切换要记住两件事：`change_scene_*` 存在 `current_scene` 空窗期，稳定访问新关卡请等 `scene_changed`；“重开本关”用 `reload_current_scene`，“跨关延续”放 AutoLoad。
