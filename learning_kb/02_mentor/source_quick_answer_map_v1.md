# Source Quick-Answer Map v1 (Godot 4.6)

Last Updated: 2026-02-07
Status: Working
Version Scope: 4.6

用途：把高频问题快速映射到“类 -> 函数链路 -> 证据位置”，用于 5 分钟内源码级答疑。

| QID | High-frequency Question | Class / Area | Function Chain (Entry -> Key Path) | Evidence |
| --- | --- | --- | --- | --- |
| SQ01 | `_process` vs `_physics_process` 怎么选？ | Main loop + Node | `Main::iteration` -> `MainLoop::physics_process` / `MainLoop::process` -> Node callbacks | `godot/main/main.cpp`, `godot/doc/classes/Node.xml` |
| SQ02 | `queue_free` 为何不是立即销毁？ | SceneTree | `queue_delete` -> `delete_queue` -> `_flush_delete_queue` | `godot/scene/main/scene_tree.cpp` |
| SQ03 | `move_and_slide` 为什么建议放 physics？ | CharacterBody2D | `move_and_slide` delta branch -> physics/idle delta fetch | `godot/scene/2d/physics/character_body_2d.cpp`, `godot/doc/classes/CharacterBody2D.xml` |
| SQ04 | `is_on_floor()` 何时可信？ | CharacterBody2D | `move_and_slide` updates flags -> `is_on_floor` reads last solve state | `godot/scene/2d/physics/character_body_2d.cpp`, `godot/doc/classes/CharacterBody2D.xml` |
| SQ05 | `velocity` 为啥不能乘 delta？ | CharacterBody2D docs | `velocity` is px/s; `move_and_slide` already handles step timing | `godot/doc/classes/CharacterBody2D.xml` |
| SQ06 | Camera 跟随抖动常见根因？ | Camera2D | `_update_process_callback` -> internal process/physics notifications -> `get_camera_transform` smoothing branch | `godot/scene/2d/camera_2d.cpp`, `godot/doc/classes/Camera2D.xml` |
| SQ07 | Camera 实际屏幕位置怎么看？ | Camera2D | `global_position` (node) vs `get_screen_center_position` / `get_target_position` | `godot/doc/classes/Camera2D.xml` |
| SQ08 | 节点复用后 `_ready` 不再触发？ | Node lifecycle | `_propagate_ready` one-shot behavior -> `request_ready` resets ready flag | `godot/scene/main/node.cpp`, `godot/doc/classes/Node.xml` |
| SQ09 | Gameplay 输入用 `_input` 还是 unhandled？ | Node input pipeline | `_input` first, GUI consume, then `_unhandled_key_input` / `_unhandled_input` | `godot/doc/classes/Node.xml` |
| SQ10 | 回调执行顺序可控吗？ | Node scheduling | `process_priority` / `process_physics_priority` lower value first | `godot/doc/classes/Node.xml` |
| SQ11 | `ResourceLoader.load` 默认是缓存复用吗？ | ResourceLoader | `load(cache_mode=REUSE)` -> `_load_start` -> `ResourceCache::get_ref` | `godot/doc/classes/ResourceLoader.xml`, `godot/core/io/resource_loader.cpp` |
| SQ12 | 线程加载为什么还会卡住？ | ResourceLoader threaded load | `load_threaded_request` -> `load_threaded_get_status` -> premature `load_threaded_get` blocks | `godot/doc/classes/ResourceLoader.xml`, `godot/core/io/resource_loader.cpp` |
| SQ13 | `PackedScene.instantiate` 后的首个通知点？ | PackedScene | `PackedScene::instantiate` -> `Node::NOTIFICATION_SCENE_INSTANTIATED` | `godot/doc/classes/PackedScene.xml`, `godot/scene/resources/packed_scene.cpp` |
| SQ14 | `Performance` 指标从哪里来？ | Performance | `Performance::get_monitor` -> Engine/RS/PhysicsServer counters | `godot/main/performance.cpp`, `godot/doc/classes/Performance.xml` |
| SQ15 | 为什么 release 包里部分 monitor 为 0？ | Performance docs | debug-only monitor behavior note | `godot/doc/classes/Performance.xml` |
| SQ16 | 提高 physics tick 后为何慢动作？ | Engine timing | `physics_ticks_per_second` + `max_physics_steps_per_frame` coupling | `godot/doc/classes/Engine.xml` |
| SQ17 | FPS 上限和 VSync 如何交互？ | Engine/Display timing | `Engine.max_fps` with `ProjectSettings display/window/vsync/vsync_mode` | `godot/doc/classes/Engine.xml`, `godot/doc/classes/ProjectSettings.xml` |
| SQ18 | 导出后运行时 load 失败常见原因？ | Export/resource pipeline | `ResourceLoader.load` note -> `editor/export/convert_text_resources_to_binary` | `godot/doc/classes/ResourceLoader.xml`, `godot/doc/classes/ProjectSettings.xml` |
| SQ19 | 性能计时为什么用 ticks 而非系统时间？ | Time | monotonic `get_ticks_usec/get_ticks_msec` | `godot/doc/classes/Time.xml` |
| SQ20 | 如何判断当前是 debug/template/平台特性？ | OS features | `OS.is_debug_build` + `OS.has_feature` | `godot/doc/classes/OS.xml` |
| SQ21 | 为什么 release 里某些 monitor 是 0？ | Performance docs | debug-only monitor notes | `godot/doc/classes/Performance.xml` |
| SQ22 | Custom monitor 为什么不能返回负值？ | Performance custom monitor | custom monitor value constraints in class description | `godot/doc/classes/Performance.xml` |
| SQ23 | 为什么 TIME_FPS 不是每帧都变？ | Performance timing monitor | `TIME_FPS` updates once per second | `godot/doc/classes/Performance.xml` |
| SQ24 | `use_sub_threads=true` 何时会更卡？ | ResourceLoader threaded loading | threaded request with sub-threads may impact main thread | `godot/doc/classes/ResourceLoader.xml` |
| SQ25 | `ResourceLoader.list_directory` 顺序为何每次不同？ | Resource listing | listing order is non-deterministic across OS | `godot/doc/classes/ResourceLoader.xml` |
| SQ26 | `exists(path)` true 为何仍像“没文件”？ | Resource cache semantics | `take_over_path` can make exists true without saved file | `godot/doc/classes/ResourceLoader.xml` |
| SQ27 | 为什么 `PackedScene.pack` 少了子节点？ | Scene packing | `pack` only includes owned sub-nodes (`Node.owner`) | `godot/doc/classes/PackedScene.xml` |
| SQ28 | `max_fps` 为何受限于刷新率？ | Engine + DisplayServer | V-Sync precedence + `screen_get_refresh_rate` | `godot/doc/classes/Engine.xml`, `godot/doc/classes/DisplayServer.xml` |
| SQ29 | 如何区分 template debug 与 editor debug？ | OS runtime identity | combine `OS.has_feature("template")` and `OS.is_debug_build` | `godot/doc/classes/OS.xml` |
| SQ30 | 导出后文本资源加载差异从哪来？ | Project export settings | `convert_text_resources_to_binary` and runtime load note | `godot/doc/classes/ProjectSettings.xml`, `godot/doc/classes/ResourceLoader.xml` |
| SQ31 | `screen_get_refresh_rate` 为什么会是 -1？ | DisplayServer screen info | invalid screen / unsupported platform fallback path | `godot/doc/classes/DisplayServer.xml` |
| SQ32 | 运行时改 V-Sync 为何不生效？ | ProjectSettings vs runtime API | startup-only project setting -> runtime needs `window_set_vsync_mode` | `godot/doc/classes/ProjectSettings.xml`, `godot/doc/classes/DisplayServer.xml` |
| SQ33 | 目录遍历顺序为何跨 OS 变化？ | DirAccess listing | `list_dir_begin` order non-deterministic -> use sorted lists | `godot/doc/classes/DirAccess.xml` |
| SQ34 | `ConfigFile` 为何改了值但重启丢失？ | Config persistence | mutate-in-memory -> explicit save required | `godot/doc/classes/ConfigFile.xml` |
| SQ35 | `ConfigFile` 为什么键名带空格后异常？ | ConfigFile format constraints | section/property names can't contain spaces | `godot/doc/classes/ConfigFile.xml` |
| SQ36 | 导出后为何应优先 `ResourceLoader` 而非 `FileAccess`？ | Exported resource access | exported resources may be converted, source files absent | `godot/doc/classes/FileAccess.xml`, `godot/doc/classes/ProjectSettings.xml` |
| SQ37 | `flush()` 该何时使用？ | File write safety | crash-safety trade-off vs performance overhead | `godot/doc/classes/FileAccess.xml` |
| SQ38 | `user://` 的真实路径如何确认？ | User data path | `OS.get_user_data_dir` absolute path by platform | `godot/doc/classes/OS.xml` |
| SQ39 | Web 平台存档为何偶发不持久？ | User FS persistence | `OS.is_userfs_persistent` indicates persistence availability | `godot/doc/classes/OS.xml` |
| SQ40 | `application/run/max_fps` 与 `Engine.max_fps` 如何分工？ | Startup vs runtime FPS cap | project setting read on startup, runtime should set Engine | `godot/doc/classes/ProjectSettings.xml`, `godot/doc/classes/Engine.xml` |
| SQ41 | 运行时改 V-Sync 为何不生效？ | ProjectSettings/DisplayServer | startup-only project setting -> runtime API switch | `godot/doc/classes/ProjectSettings.xml`, `godot/doc/classes/DisplayServer.xml` |
| SQ42 | V-Sync 模式设置后为何回退到 Enabled？ | DisplayServer runtime vsync | unsupported mode fallback to `VSYNC_ENABLED` | `godot/doc/classes/DisplayServer.xml` |
| SQ43 | `screen_get_refresh_rate` 为什么需要兜底 60Hz？ | Display refresh query | may return `-1.0` on invalid/unsupported cases | `godot/doc/classes/DisplayServer.xml` |
| SQ44 | 目录遍历如何保证跨平台稳定？ | DirAccess traversal | non-deterministic stream -> use sorted `get_files/get_directories` | `godot/doc/classes/DirAccess.xml` |
| SQ45 | `ResourceLoader.list_directory` 返回的文件名语义？ | Resource listing | original editor-visible resource names + folder suffix `/` | `godot/doc/classes/ResourceLoader.xml` |
| SQ46 | `ConfigFile` 修改后为什么重启丢失？ | Config persistence | mutations are in-memory until explicit save | `godot/doc/classes/ConfigFile.xml` |
| SQ47 | `ConfigFile` 键名为什么不能带空格？ | Config naming constraints | section/property names with spaces are truncated/ignored | `godot/doc/classes/ConfigFile.xml` |
| SQ48 | `flush()` 为什么不能频繁调用？ | FileAccess write strategy | improves safety but hurts performance with constant writes | `godot/doc/classes/FileAccess.xml` |
| SQ49 | 为什么导出后应优先 `ResourceLoader` 读资源？ | Exported resources | source files may be converted/missing in exported PCK | `godot/doc/classes/FileAccess.xml`, `godot/doc/classes/ProjectSettings.xml` |
| SQ50 | Web 平台怎样做存档降级策略？ | UserFS persistence gating | check `is_userfs_persistent` then enable/disable persistence path | `godot/doc/classes/OS.xml` |
| SQ51 | `GROUP_CALL_UNIQUE` 为什么没去重？ | SceneTree group calls | `call_group_flags` -> unique path requires deferred | `godot/doc/classes/SceneTree.xml`, `godot/scene/main/scene_tree.cpp` |
| SQ52 | 怎么让组调用按反向顺序执行？ | SceneTree group calls | `GROUP_CALL_REVERSE` -> reverse for-loop dispatch | `godot/doc/classes/SceneTree.xml`, `godot/scene/main/scene_tree.cpp` |
| SQ53 | `notify_group_flags` 与 `call_group_flags` 如何选？ | SceneTree notifications | method call path vs `Object.notification` broadcast path | `godot/doc/classes/SceneTree.xml`, `godot/scene/main/scene_tree.cpp` |
| SQ54 | deferred 组调用何时执行？ | Message queue timing | `GROUP_CALL_DEFERRED` -> `MessageQueue::push_callp/push_notification` | `godot/scene/main/scene_tree.cpp` |
| SQ55 | `PackedScene.pack` 为什么漏节点？ | Scene persistence ownership | `pack` -> `_parse_node` owner checks -> save owned nodes | `godot/doc/classes/PackedScene.xml`, `godot/scene/resources/packed_scene.cpp` |
| SQ56 | JSON 解析要诊断错误该用哪个接口？ | JSON parsing | `JSON.parse` + `get_error_line/get_error_message` | `godot/doc/classes/JSON.xml`, `godot/core/io/json.cpp` |
| SQ57 | `parse_string` 失败后为什么难定位？ | JSON parsing | static `parse_string` returns null on failure path | `godot/doc/classes/JSON.xml`, `godot/core/io/json.cpp` |
| SQ58 | 保留原始 JSON 文本有什么用？ | JSON round-trip | `parse(keep_text=true)` -> `get_parsed_text` for later save path | `godot/doc/classes/JSON.xml`, `godot/core/io/json.cpp` |
| SQ59 | 运行时切换 AA 参数走哪条链路？ | Viewport/RenderingServer | `Viewport::set_*` -> `RenderingServer.viewport_set_*` | `godot/doc/classes/Viewport.xml`, `godot/scene/main/viewport.cpp`, `godot/servers/rendering/rendering_server.h` |
| SQ60 | debanding 为什么有时不生效？ | Viewport renderer constraints | `use_debanding` limited by renderer/mode conditions | `godot/doc/classes/Viewport.xml` |
| SQ61 | `change_scene_to_node` 后为何短暂没有 current scene？ | SceneTree scene switch | remove old scene now -> pending new scene -> `_flush_scene_change` later | `godot/doc/classes/SceneTree.xml`, `godot/scene/main/scene_tree.cpp` |
| SQ62 | 什么时候可以可靠访问新场景？ | SceneTree scene switch | wait for `scene_changed` after `_flush_scene_change` add_child | `godot/doc/classes/SceneTree.xml`, `godot/scene/main/scene_tree.cpp` |
| SQ63 | `change_scene_to_file` 为什么在线程里失败？ | SceneTree thread context | main-thread guard in `change_scene_to_file` / `reload_current_scene` | `godot/scene/main/scene_tree.cpp` |
| SQ64 | 场景切换的“新场景提交点”在哪个阶段？ | SceneTree process pipeline | `process()` -> `_flush_scene_change` when `pending_new_scene_id` valid | `godot/scene/main/scene_tree.cpp` |
| SQ65 | `create_timer` timeout 为何总在节点逻辑后？ | SceneTree timers | `_process` first -> `process_timers` later in frame | `godot/doc/classes/SceneTree.xml`, `godot/scene/main/scene_tree.cpp` |
| SQ66 | `process_in_physics=true` 的 timer 语义是什么？ | SceneTree timers | timer updated at end of physics frame, not process frame | `godot/doc/classes/SceneTree.xml`, `godot/scene/main/scene_tree.cpp` |
| SQ67 | JSON 资源在 editor 与 runtime 失败行为为何不同？ | JSON resource loader | `ResourceFormatLoaderJSON::load` branches by `is_editor_hint()` | `godot/core/io/json.cpp` |
| SQ68 | JSON 资源保存时何时保留原文本？ | JSON resource saver | `get_parsed_text` non-empty -> save source text, else stringify | `godot/doc/classes/JSON.xml`, `godot/core/io/json.cpp` |
| SQ69 | `parse(..., keep_text=true)` 的工程价值是什么？ | JSON parse options | preserve parsed text for later resource save round-trip | `godot/doc/classes/JSON.xml`, `godot/core/io/json.cpp` |
| SQ70 | `use_debanding` 在哪些情况下无效？ | Viewport renderer constraints | no effect in Compatibility; 2D effect depends on HDR/background mode | `godot/doc/classes/Viewport.xml` |

## Usage Rule

- 回答源码问题时先从 SQ 映射找到入口，再给“结论 + 函数链路 + 证据 + 验证步骤”。
