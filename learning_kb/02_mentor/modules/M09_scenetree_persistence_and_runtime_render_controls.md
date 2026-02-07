# M09 - SceneTree Orchestration, Persistence Boundaries, and Runtime Render Controls

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

## Core Conclusion

- `SceneTree.call_group_flags`/`notify_group_flags` 是批量编排入口；`GROUP_CALL_DEFERRED` 会进入消息队列，`GROUP_CALL_REVERSE` 改变执行顺序。
- `GROUP_CALL_UNIQUE` 只在与 `GROUP_CALL_DEFERRED` 组合时生效，可避免同帧重复调度同组同方法。
- `PackedScene.pack(node)` 只会持久化 `node` 及其 owned 子节点（`Node.owner` 边界），owner 配置错误会导致“子节点丢失”。
- JSON 解析优先 `JSON.parse()`（可拿 `get_error_message/get_error_line`）；`JSON.parse_string()` 适合快速路径但错误信息不可编排。
- Viewport 抗锯齿与像素对齐参数可运行时切换，并最终下发到 `RenderingServer.viewport_set_*`，适合做画质设置面板。

## Evidence

- Class docs: `godot/doc/classes/SceneTree.xml`
  - `call_group_flags`, `notify_group_flags`
  - `GROUP_CALL_REVERSE`, `GROUP_CALL_DEFERRED`, `GROUP_CALL_UNIQUE`
- Source: `godot/scene/main/scene_tree.cpp`
  - `SceneTree::call_group_flagsp`
  - `SceneTree::notify_group_flags`
  - `MessageQueue::push_callp/push_notification`
- Class docs: `godot/doc/classes/PackedScene.xml`
  - `pack` + `Node.owner` 说明
- Source: `godot/scene/resources/packed_scene.cpp`
  - `SceneState::_parse_node`
  - `SceneState::pack`
- Class docs: `godot/doc/classes/JSON.xml`
  - `parse`, `parse_string`, `get_error_message`, `get_error_line`, `get_parsed_text`
- Source: `godot/core/io/json.cpp`
  - `JSON::parse`
  - `JSON::parse_string`
- Class docs: `godot/doc/classes/Viewport.xml`
  - `msaa_2d`, `msaa_3d`, `screen_space_aa`, `use_taa`, `use_debanding`
  - `snap_2d_transforms_to_pixel`, `snap_2d_vertices_to_pixel`
- Source: `godot/scene/main/viewport.cpp`
  - `Viewport::set_msaa_2d`, `set_msaa_3d`, `set_screen_space_aa`
  - `Viewport::set_use_taa`, `set_use_debanding`
  - `Viewport::set_snap_2d_transforms_to_pixel`, `set_snap_2d_vertices_to_pixel`
- Source: `godot/servers/rendering/rendering_server.h`
  - `viewport_set_msaa_2d`, `viewport_set_msaa_3d`, `viewport_set_screen_space_aa`
  - `viewport_set_use_taa`, `viewport_set_use_debanding`
  - `viewport_set_snap_2d_transforms_to_pixel`, `viewport_set_snap_2d_vertices_to_pixel`

## Teaching Use

- 可作为“运行时系统编排 + 序列化边界 + 画质实时设置”组合课。
- 给学员一个统一心智模型：
  1. 批量调度用 `SceneTree group flags`
  2. 场景持久化看 `Node.owner`
  3. 解析健壮性看 `JSON.parse` 错误接口
  4. 视觉调参落到 `Viewport/RenderingServer`

## Fast Answer Snippet

- 同帧去重批量调用：`GROUP_CALL_DEFERRED | GROUP_CALL_UNIQUE`；打包场景缺节点先查 owner；JSON 线上配置解析优先 `parse()`；画质切换走 `Viewport` 运行时 setter。
