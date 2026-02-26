# Source Quick-Answer Map v1 (Godot 4.6)

Last Updated: 2026-02-22
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
| SQ71 | 重复 `connect` 为什么报错？ | Object signal connect | duplicate callable rejected unless `CONNECT_REFERENCE_COUNTED` | `godot/doc/classes/Object.xml`, `godot/core/object/object.cpp` |
| SQ72 | one-shot 信号为什么不会递归连环触发？ | Object signal emit | one-shot slots are disconnected before signal callback dispatch | `godot/core/object/object.cpp` |
| SQ73 | `CONNECT_DEFERRED` 到底延迟到哪里执行？ | Object/message queue | deferred signals push callables into `MessageQueue` idle path | `godot/doc/classes/Object.xml`, `godot/core/object/object.cpp` |
| SQ74 | 为什么 `emit_signal` 没有触发任何回调？ | Object signal blocking | `_block_signals` early-return in `emit_signalp` | `godot/doc/classes/Object.xml`, `godot/core/object/object.cpp` |
| SQ75 | 为什么 `_gui_input` 不触发？ | Control input routing | ignore/occluded/parent-stop/clip/outside checks block callback | `godot/doc/classes/Control.xml` |
| SQ76 | `MOUSE_FILTER_STOP/PASS/IGNORE` 如何影响冒泡？ | Control/Viewport input routing | STOP handles pointer events; PASS bubbles; IGNORE skips receive | `godot/doc/classes/Control.xml`, `godot/scene/main/viewport.cpp` |
| SQ77 | `accept_event()` 的底层效果是什么？ | Control/Viewport input routing | control delegates to viewport `_gui_accept_event` then input handled | `godot/scene/gui/control.cpp`, `godot/scene/main/viewport.cpp` |
| SQ78 | 暂停后节点是否继续运行如何判断？ | Node process gate | `can_process` -> `_can_process(paused)` + `process_mode` branch | `godot/doc/classes/Node.xml`, `godot/scene/main/node.cpp` |
| SQ79 | 暂停时 timer 为何还在走？ | SceneTree timer semantics | `process_timers` skips only when paused and `!process_always` | `godot/doc/classes/SceneTree.xml`, `godot/scene/main/scene_tree.cpp` |
| SQ80 | 动态开关输入回调为何立刻生效？ | Node input callback registration | set_process_* toggles `_vp_*<viewport_id>` dispatch groups | `godot/scene/main/node.cpp` |
| SQ81 | 为什么刚移动后 `get_overlapping_bodies` 还是旧结果？ | Area2D overlap cache | overlaps list updated once per physics step | `godot/doc/classes/Area2D.xml` |
| SQ82 | `monitoring` 和 `monitorable` 有什么区别？ | Area2D monitoring gates | detect others vs be detected by other monitoring areas | `godot/doc/classes/Area2D.xml`, `godot/scene/2d/physics/area_2d.cpp` |
| SQ83 | `body_entered` 为什么不触发？ | Area2D + layer/mask | check `monitoring` and layer-mask intersection rule | `godot/doc/classes/Area2D.xml`, `godot/doc/classes/CollisionObject2D.xml` |
| SQ84 | Area2D 的 `body_entered` 为啥收到 TileMap？ | Area2D body signal semantics | signal body can be `PhysicsBody2D` or `TileMap` with colliding tiles | `godot/doc/classes/Area2D.xml` |
| SQ85 | 怎样从 `body_shape_entered` 的 index 找到具体 shape 节点？ | CollisionObject2D shape owner API | `shape_find_owner` -> `shape_owner_get_owner` | `godot/doc/classes/Area2D.xml`, `godot/doc/classes/CollisionObject2D.xml` |
| SQ86 | layer/mask 的检测规则一句话怎么说？ | CollisionObject2D bitmask | B.layer must be included in A.mask for A to detect B | `godot/doc/classes/CollisionObject2D.xml` |
| SQ87 | `set_collision_layer_value` 做了什么？ | CollisionObject2D bit operations | writes layer bit by `1 << (layer_number - 1)` | `godot/scene/2d/physics/collision_object_2d.cpp` |
| SQ88 | 回调里切 monitoring 为什么报错？ | Area2D signal reentrancy guard | `locked` guard blocks direct mutation, use deferred | `godot/scene/2d/physics/area_2d.cpp` |
| SQ89 | 为何碰撞对象“有节点但没交互”？ | CollisionObject2D shape requirement | no shape -> can't collide/interact warning | `godot/scene/2d/physics/collision_object_2d.cpp` |
| SQ90 | 收集物回收为何用 `queue_free`？ | Node/SceneTree deletion timing | queue at frame end via SceneTree delete queue | `godot/doc/classes/Node.xml`, `godot/scene/main/scene_tree.cpp` |
| SQ91 | `_unhandled_input` 在输入链里排第几？ | Viewport input dispatch order | order is `_input -> _gui_input -> _shortcut_input -> _unhandled_key_input -> _unhandled_input` | `godot/doc/classes/Viewport.xml`, `godot/scene/main/viewport.cpp` |
| SQ92 | 为什么 `_unhandled_input` 有时收不到事件？ | Input handled short-circuit | earlier stage called `set_input_as_handled`, later stages are skipped | `godot/doc/classes/Viewport.xml`, `godot/scene/main/viewport.cpp` |
| SQ93 | 为什么一个热键会触发两次？ | Multiple node unhandled listeners | event keeps propagating if no node marks input handled | `godot/doc/classes/Node.xml`, `godot/doc/classes/Viewport.xml` |
| SQ94 | 暂停后角色为何还在动？ | process_mode inheritance pitfall | child inherited parent `ALWAYS` so pause gate does not stop processing | `godot/doc/classes/Node.xml`, `godot/scene/main/node.cpp` |
| SQ95 | `INHERIT` 在根节点下会变成什么？ | Node process mode fallback | when no owner, inherit resolves to `PAUSABLE` fallback | `godot/scene/main/node.cpp` |
| SQ96 | `SceneTree.paused=true` 会停什么？ | SceneTree pause semantics | physics stops and node callbacks depend on each node process_mode | `godot/doc/classes/SceneTree.xml`, `godot/scene/main/scene_tree.cpp` |
| SQ97 | `reload_current_scene` 底层做了什么？ | SceneTree reload flow | read current scene file path and route through `change_scene_to_file` | `godot/scene/main/scene_tree.cpp` |
| SQ98 | 为什么重开后 autoload 状态没清零？ | Scene reload scope boundary | reload rebuilds current scene, not root-level autoload nodes | `godot/doc/classes/SceneTree.xml`, `godot/scene/main/scene_tree.cpp` |
| SQ99 | 为什么暂停时有的节点还能收输入？ | SceneTree input dispatch + can_process | `_call_input_pause` skips nodes failing `can_process`; `ALWAYS` still runs | `godot/scene/main/scene_tree.cpp`, `godot/scene/main/node.cpp` |
| SQ100 | `_ready` 的父子调用顺序是什么？ | Node lifecycle order | `_enter_tree` parent-first, `_ready` child-first then parent | `godot/doc/classes/Node.xml` |
| SQ101 | 为什么切场景后 `current_scene` 会暂时是空？ | Scene change two-phase commit | old scene removed immediately, new scene committed at frame end | `godot/doc/classes/SceneTree.xml`, `godot/scene/main/scene_tree.cpp` |
| SQ102 | 切关后什么时候能稳定访问新场景？ | SceneTree `scene_changed` timing | await `scene_changed`, emitted after new scene is added and initialized | `godot/doc/classes/SceneTree.xml`, `godot/scene/main/scene_tree.cpp` |
| SQ103 | `change_scene_to_file` 失败怎么判断原因？ | SceneTree error code mapping | returns `ERR_CANT_OPEN` for load fail, `ERR_CANT_CREATE` for instantiate fail | `godot/doc/classes/SceneTree.xml`, `godot/scene/main/scene_tree.cpp` |
| SQ104 | 为什么切场景必须在主线程？ | SceneTree main-thread guard | scene change APIs guard with `Thread::is_main_thread()` | `godot/scene/main/scene_tree.cpp` |
| SQ105 | `reload_current_scene` 底层用的是什么路径？ | SceneTree reload route | reads `current_scene->get_scene_file_path()` then `change_scene_to_file` | `godot/scene/main/scene_tree.cpp` |
| SQ106 | `change_scene_to_packed` 什么时候会报参数错误？ | SceneTree packed scene validation | null packed scene returns `ERR_INVALID_PARAMETER` | `godot/doc/classes/SceneTree.xml`, `godot/scene/main/scene_tree.cpp` |
| SQ107 | pending 切换时再次切场景会怎样？ | SceneTree pending scene replacement | previous pending scene is queued for delete before replacing | `godot/scene/main/scene_tree.cpp` |
| SQ108 | `root` 与 `current_scene`、autoload 的关系是什么？ | SceneTree root child boundary | root children may include current_scene and autoloads | `godot/doc/classes/SceneTree.xml` |
| SQ109 | 为什么切场景后旧场景引用会失效？ | SceneTree ownership and free | SceneTree takes ownership and frees previous scene on next change | `godot/doc/classes/SceneTree.xml`, `godot/scene/main/scene_tree.cpp` |
| SQ110 | 多关卡中 `R` 重开为何推荐 `reload_current_scene`？ | Restart semantics by current scene | keeps restart scoped to current level, avoids hardcoded back-jump | `godot/doc/classes/SceneTree.xml`, `godot/scene/main/scene_tree.cpp` |
| SQ111 | `create_timer` 的对象生命周期是什么？ | SceneTreeTimer one-shot lifecycle | emits `timeout` then dereferenced/auto-freed unless retained by reference | `godot/doc/classes/SceneTree.xml`, `godot/doc/classes/SceneTreeTimer.xml` |
| SQ112 | 为什么暂停后有的 timer 不走了？ | SceneTree pause gate for timers | paused tree skips timers with `process_always=false` | `godot/doc/classes/SceneTree.xml`, `godot/scene/main/scene_tree.cpp` |
| SQ113 | `process_in_physics=true` 的 timer 在哪一阶段更新？ | SceneTree timer phase selection | timer updates at end of physics frame, after node physics callbacks | `godot/doc/classes/SceneTree.xml`, `godot/scene/main/scene_tree.cpp` |
| SQ114 | `ignore_time_scale` 底层影响了什么？ | Timer delta source switch | timer subtracts unscaled step instead of frame delta when enabled | `godot/doc/classes/SceneTree.xml`, `godot/scene/main/scene_tree.cpp` |
| SQ115 | 为什么 timer 看起来总比 `_process` 晚一步？ | Node callbacks vs timer order | node callbacks run first, timer updates later in same frame | `godot/doc/classes/SceneTree.xml`, `godot/doc/classes/SceneTreeTimer.xml` |
| SQ116 | timeout 回调里新建 timer 为何不在同轮处理？ | Timer traversal boundary snapshot | traversal breaks at initial last element, new timers wait next pass | `godot/scene/main/scene_tree.cpp` |
| SQ117 | 为什么 `time_left` 读不到负数？ | SceneTreeTimer getter clamp | `get_time_left` returns `MAX(time_left, 0)` | `godot/scene/main/scene_tree.cpp` |
| SQ118 | timeout 发出后 timer 是何时移除的？ | Timeout emit then erase | emits `timeout` first, then erases timer from list | `godot/scene/main/scene_tree.cpp` |
| SQ119 | 场景树销毁时如何避免 timer 残留连接？ | SceneTree finalize cleanup | finalize releases timer connections and clears timer list | `godot/scene/main/scene_tree.cpp` |
| SQ120 | `Engine.time_scale` 与 timer 精度有什么关系？ | Time-scale and simulation precision | time_scale affects timers; high scale may require higher physics ticks | `godot/doc/classes/Engine.xml`, `godot/doc/classes/SceneTree.xml` |
| SQ121 | 为什么设置音量前要先查 bus 索引？ | Audio bus existence guard | `get_bus_index` may return `-1`; invalid index means no effective volume change | `godot/doc/classes/AudioServer.xml`, `godot/servers/audio/audio_server.cpp` |
| SQ122 | `set_bus_volume_linear` 和 `set_bus_volume_db` 的关系？ | Linear-to-dB mapping | linear setter internally converts with `linear_to_db` then calls dB setter | `godot/doc/classes/AudioServer.xml`, `godot/servers/audio/audio_server.cpp` |
| SQ123 | 全屏切换为什么会影响窗口边框？ | Fullscreen borderless side effect | fullscreen/exclusive fullscreen forces borderless behavior | `godot/doc/classes/DisplayServer.xml` |
| SQ124 | 运行时切窗口模式的统一入口是什么？ | DisplayServer mode API | use `DisplayServer.window_set_mode/window_get_mode` with `WindowMode` enums | `godot/doc/classes/DisplayServer.xml`, `godot/servers/display/display_server.h` |
| SQ125 | `Window.mode` 与 `DisplayServer.window_set_mode` 如何选？ | Node API vs server API boundary | both can switch mode, but `Window.mode` applies to native windows; server API is global runtime entrypoint | `godot/doc/classes/Window.xml`, `godot/doc/classes/DisplayServer.xml` |
| SQ126 | 为什么运行时改键位重启后会丢失？ | InputMap persistence boundary | `action_add_event/erase` mutate runtime map only; no automatic persistence to project defaults | `godot/doc/classes/InputMap.xml`, `godot/core/input/input_map.cpp` |
| SQ127 | 如何一键恢复默认按键映射？ | InputMap restore default | `load_from_project_settings` clears current map then reloads `input/*` from ProjectSettings | `godot/doc/classes/InputMap.xml`, `godot/core/input/input_map.cpp` |
| SQ128 | 重复添加同一输入事件会怎样？ | InputMap duplicate guard | `action_add_event` exits early when existing event is found | `godot/core/input/input_map.cpp` |
| SQ129 | 清空 action 事件时为什么还要释放按下态？ | Input state consistency on erase | `action_erase_events` calls `action_release` before clearing events if pressed | `godot/core/input/input_map.cpp` |
| SQ130 | `event_is_action` 为何对松开事件有时忽略修饰键？ | Modifier matching rule | for proper release detection, non-pressed events can ignore modifiers in this check | `godot/doc/classes/InputMap.xml` |

## Usage Rule

- 回答源码问题时先从 SQ 映射找到入口，再给“结论 + 函数链路 + 证据 + 验证步骤”。
