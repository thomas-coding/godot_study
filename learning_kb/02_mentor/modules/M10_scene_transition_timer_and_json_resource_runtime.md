# M10 - Scene Transition Timing, Timer Order, and JSON Resource Runtime Semantics

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

## Core Conclusion

- `change_scene_to_node()` 会立即把旧场景从树上移除，但新场景不是立刻可用；新场景在后续 `process` 帧的 `_flush_scene_change()` 中加入树并触发 `scene_changed`。
- `change_scene_to_file()` / `reload_current_scene()` / `unload_current_scene()` 都有主线程约束，跨线程直接调用会失败。
- `create_timer()` 的计时更新发生在节点处理之后；`process_in_physics=true` 时，计时器在 physics 帧末更新。
- JSON 作为资源加载时，底层走 `JSON::parse()`；在编辑器环境解析失败会告警但允许继续打开，运行时则返回错误并中断加载。
- JSON 资源保存优先复用 `get_parsed_text()`（若有 `keep_text`），否则才 `JSON::stringify()` 生成文本。

## Evidence

- Class docs: `godot/doc/classes/SceneTree.xml`
  - `change_scene_to_node`（旧场景先移除，新场景帧末加入）
  - `scene_changed`（新场景可用的同步点）
  - `create_timer`（timer 更新顺序说明）
- Source: `godot/scene/main/scene_tree.cpp`
  - `SceneTree::change_scene_to_file`（主线程 guard）
  - `SceneTree::change_scene_to_node`（pending scene 机制）
  - `SceneTree::process`（`_flush_scene_change` 触发点）
  - `SceneTree::physics_process` / `SceneTree::process`（`process_timers` 调用顺序）
- Class docs: `godot/doc/classes/JSON.xml`
  - `parse`, `get_error_line`, `get_error_message`, `get_parsed_text`
- Source: `godot/core/io/json.cpp`
  - `ResourceFormatLoaderJSON::load`（editor/runtime 分支）
  - `ResourceFormatSaverJSON::save`（`get_parsed_text` 优先）

## Teaching Use

- 场景切换相关答疑统一给出“remove now + add later”心智模型，避免“为什么 current_scene 暂时为空”的误判。
- 延时逻辑优先解释“计时器在节点处理之后更新”，帮助学员理解一帧内事件先后顺序。
- JSON 配置/资源排错时，先判断当前是 editor 还是 runtime，再走不同错误处理路径。

## Fast Answer Snippet

- 场景切换是两阶段提交：先移除旧场景，再在后续 process 帧提交新场景并发 `scene_changed`；JSON 资源解析在 editor 与 runtime 的失败策略不同，线上问题优先看 runtime 分支。
