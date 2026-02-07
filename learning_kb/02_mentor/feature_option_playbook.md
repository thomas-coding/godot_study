# Feature Option Playbook (Godot 4.6)

Last Updated: 2026-02-07
Status: Working
Version Scope: 4.6

目标：同一 feature 默认给 2-3 个实现路径，并明确 trade-off，降低试错成本。

## F001 - Platformer input sampling strategy

### Option A (Recommended)
- 路径：`_unhandled_input`/`_unhandled_key_input` 采样输入意图，`_physics_process` 执行移动与跳跃。
- 优点：GUI 先拦截，输入语义清晰；运动与物理步长一致，手感稳定。
- 缺点：需要维护输入状态（按下/松开）与动作缓存。
- 适用：大多数 2D 平台跳跃项目。

### Option B
- 路径：全部在 `_physics_process` 用 `Input.is_action_pressed/just_pressed` 轮询。
- 优点：实现最简单，初学者上手快。
- 缺点：复杂 UI 场景下事件优先级不如 unhandled 回调清晰。
- 适用：无复杂 UI 的最小原型。

### Option C
- 路径：`_input` 直接处理 gameplay 输入。
- 优点：拿事件最及时。
- 缺点：容易与 GUI 竞争输入焦点，后期维护成本高。
- 适用：几乎无 UI、短期演示项目。

## F002 - Slope adhesion strategy for CharacterBody2D

### Option A (Recommended)
- 路径：使用 `floor_snap_length` + `move_and_slide()` 默认地面模式。
- 优点：配置简单，官方路径；下坡贴地与跳跃脱离语义较一致。
- 缺点：参数需要按角色尺寸微调。
- 适用：常规平台动作。

### Option B
- 路径：在特定时机主动调用 `apply_floor_snap()`。
- 优点：可控性更强，适合修正边界帧行为。
- 缺点：逻辑更复杂，易引入“吸附过强”副作用。
- 适用：有特殊地形/状态机的角色控制器。

### Option C
- 路径：不启用 snap，仅靠碰撞与重力。
- 优点：行为直观，调参少。
- 缺点：下坡容易短暂离地，表现不稳定。
- 适用：top-down 或非平台类型角色。

## F003 - Camera2D follow update domain

### Option A (Recommended for platformer)
- 路径：玩家 movement 在 `_physics_process`，Camera `process_callback=Physics`。
- 优点：更新节奏一致，跟随抖动概率低。
- 缺点：若 UI/特效依赖 idle 插值，需额外协调表现层。
- 适用：角色物理驱动明显的 2D 动作游戏。

### Option B
- 路径：玩家 movement 在 `_process`，Camera `process_callback=Idle`。
- 优点：视觉上连续，动画系统一致性好。
- 缺点：物理相关手感与碰撞反馈易受帧率影响。
- 适用：弱物理、强演出类相机。

### Option C
- 路径：Camera 开 smoothing，但通过 `reset_smoothing`/`force_update_scroll` 控制关键帧收敛。
- 优点：可兼顾柔顺跟随与关键时刻快速对齐。
- 缺点：实现复杂度更高，状态切换易出错。
- 适用：有过场/冲刺/锁定镜头的项目。

## F004 - Reusable node initialization strategy

### Option A (Recommended)
- 路径：复用节点时，重新加入树前调用 `request_ready()`，把初始化放 `_ready`。
- 优点：生命周期语义清晰，初始化逻辑集中。
- 缺点：需要严格管理“何时 request/何时 add”。
- 适用：对象池或可复用 UI/实体节点。

### Option B
- 路径：把可重复初始化逻辑提到自定义 `init_runtime_state()`，每次手动调用。
- 优点：控制粒度高，不依赖 ready 机制。
- 缺点：调用点容易遗漏，长期维护成本高。
- 适用：复杂状态机、跨场景复用对象。

### Option C
- 路径：不复用，直接重新实例化节点。
- 优点：简单直接，生命周期最少歧义。
- 缺点：频繁创建销毁会增加资源与性能开销。
- 适用：数量少、生命周期长的对象。

## F005 - Deletion strategy (`queue_free` vs immediate free)

### Option A (Recommended)
- 路径：常规运行逻辑统一 `queue_free()`。
- 优点：与 SceneTree 帧尾删除队列语义一致，避免时序风险。
- 缺点：不是立即销毁，需要注意同帧引用。
- 适用：绝大多数 gameplay 删除场景。

### Option B
- 路径：直接 `free()`（或立即销毁）仅用于可控上下文。
- 优点：即时释放，调试语义直观。
- 缺点：时序风险高，错误上下文易引发问题。
- 适用：明确确认安全的局部工具逻辑。

### Option C
- 路径：对象池（停用/重置）替代销毁。
- 优点：减少分配释放抖动，性能更稳定。
- 缺点：状态复位复杂，bug 隐蔽性更高。
- 适用：高频生成销毁对象（弹幕、特效、敌人波次）。

## F006 - Resource loading strategy (`preload` / `load` / threaded)

### Option A (Recommended for runtime heavy scenes)
- 路径：启动期 `preload` 小资源，运行期大资源使用 `load_threaded_request + status`。
- 优点：兼顾启动确定性与运行时流畅性。
- 缺点：需要维护加载状态机与占位逻辑。
- 适用：切场景、动态内容较多的项目。

### Option B
- 路径：全部使用同步 `load`。
- 优点：实现简单，调试路径清晰。
- 缺点：大资源可能引发主线程卡顿。
- 适用：资源体量小、原型阶段。

### Option C
- 路径：全部 `preload` 在脚本常量中。
- 优点：首次使用无 IO 抖动。
- 缺点：启动内存与首包压力大，灵活性低。
- 适用：固定小场景、资源集合稳定。

## F007 - Resource cache mode strategy

### Option A (Recommended default)
- 路径：保持 `CACHE_MODE_REUSE`。
- 优点：减少重复加载与实例创建，整体成本低。
- 缺点：热更新/调试时容易出现“看起来没刷新”。
- 适用：绝大多数线上逻辑。

### Option B
- 路径：关键路径使用 `CACHE_MODE_REPLACE`。
- 优点：可刷新已有缓存实例数据。
- 缺点：行为复杂，误用时会造成隐式状态变更。
- 适用：编辑器工具链或明确刷新场景。

### Option C
- 路径：使用 `CACHE_MODE_IGNORE(_DEEP)`。
- 优点：彻底绕过缓存，便于定位缓存相关问题。
- 缺点：IO 与分配成本高，不适合常态运行。
- 适用：诊断、特殊工具模式。

## F008 - Scene spawn strategy (instantiate vs pool)

### Option A (Recommended baseline)
- 路径：`PackedScene.instantiate()` 直接生成。
- 优点：生命周期语义标准，最不易出错。
- 缺点：高频生成场景下可能带来分配抖动。
- 适用：普通频率生成对象。

### Option B
- 路径：对象池复用节点，按需 `request_ready`/手动重置。
- 优点：降低频繁实例化开销。
- 缺点：状态复位复杂，生命周期 bug 成本高。
- 适用：子弹、粒子代理、敌人波次等高频对象。

### Option C
- 路径：混合策略（核心对象池化，低频对象直接实例化）。
- 优点：在复杂度与性能间折中。
- 缺点：架构与规范要求更高。
- 适用：中后期性能优化阶段。

## F009 - Runtime performance monitoring strategy

### Option A (Recommended)
- 路径：`Performance.get_monitor()` 做基础瓶颈判域 + 自定义 monitor 做业务指标。
- 优点：定位快，覆盖引擎层与业务层。
- 缺点：需要团队约定统一采样口径。
- 适用：持续迭代项目。

### Option B
- 路径：仅看内建 monitor。
- 优点：接入成本最低。
- 缺点：缺业务上下文，release 环境可见性不足。
- 适用：早期排查。

### Option C
- 路径：纯日志/埋点方案，不接入 `Performance`。
- 优点：可跨平台统一上报体系。
- 缺点：缺失引擎内建指标，定位效率低。
- 适用：已有成熟外部监控平台的项目。

## F010 - Frame pacing strategy (FPS / physics / VSync)

### Option A (Recommended baseline)
- 路径：保持 `physics_ticks_per_second=60`，按需设置 `max_fps`，优先先稳定逻辑再调节输入延迟。
- 优点：默认稳定，跨设备行为更一致。
- 缺点：极限低延迟或高精度需求下空间有限。
- 适用：大多数 2D 项目。

### Option B
- 路径：提高 `physics_ticks_per_second` 并联动调高 `max_physics_steps_per_frame`。
- 优点：高速物体与输入响应更精细。
- 缺点：CPU 压力显著增加，调参不当会慢动作。
- 适用：高速动作/竞速类项目。

### Option C
- 路径：更依赖 VSync/刷新率策略，保守控制 `max_fps`。
- 优点：画面撕裂控制更简单，功耗可控。
- 缺点：输入延迟与平台差异处理更复杂。
- 适用：画面稳定优先、硬件目标明确的项目。

## F011 - Runtime metrics strategy (built-in vs custom)

### Option A (Recommended)
- 路径：内建 `Performance.get_monitor` + `add_custom_monitor` 混合。
- 优点：同时覆盖引擎指标与业务指标，release 可持续观测。
- 缺点：需要维护指标命名与采样标准。
- 适用：长期迭代项目。

### Option B
- 路径：只使用内建 monitor。
- 优点：实现成本最低。
- 缺点：release 下可见性受限，难追业务问题。
- 适用：短期原型。

### Option C
- 路径：只用外部埋点/日志。
- 优点：可和外部平台统一。
- 缺点：缺少引擎内建维度，定位慢。
- 适用：已有成熟数据平台团队。

## F012 - Threaded loading depth strategy (`use_sub_threads`)

### Option A (Recommended baseline)
- 路径：默认 `use_sub_threads=false`，先建立稳定帧时间基线。
- 优点：对主线程竞争更可控。
- 缺点：加载峰值可能更长。
- 适用：中小项目、优先稳定性。

### Option B
- 路径：`use_sub_threads=true`，追求更快加载完成。
- 优点：大资源场景可能显著缩短加载时间。
- 缺点：可能影响主线程，出现体感卡顿。
- 适用：资源大、加载窗口可控的项目。

### Option C
- 路径：按资源类型分流（大资源 true，小资源 false）。
- 优点：兼顾速度与稳定性。
- 缺点：策略复杂度和维护成本更高。
- 适用：内容量中后期项目。

## F013 - Export text resource conversion strategy

### Option A (Recommended when runtime load is required)
- 路径：若依赖运行时文本资源加载，明确评估并控制 `convert_text_resources_to_binary`。
- 优点：减少“编辑器可用、导出失效”风险。
- 缺点：需要提前统一导出策略。
- 适用：有运行时 `load` 的项目。

### Option B
- 路径：保持默认转换，尽量减少运行时文本加载依赖。
- 优点：流程简单，与默认导出兼容。
- 缺点：动态加载灵活性下降。
- 适用：资源基本静态打包项目。

### Option C
- 路径：运行时关键资源改用二进制/预编译流程。
- 优点：导出行为更可控。
- 缺点：工具链成本较高。
- 适用：工程化程度较高的团队。

## F014 - Runtime build identity strategy

### Option A (Recommended)
- 路径：组合使用 `OS.has_feature("template")` 与 `OS.is_debug_build()`。
- 优点：能稳定区分编辑器/导出模板以及 debug/release。
- 缺点：需要统一判断封装，避免散落代码。
- 适用：有环境分支逻辑的项目。

### Option B
- 路径：仅用 `OS.is_debug_build()`。
- 优点：代码最少。
- 缺点：无法可靠区分是否为模板运行。
- 适用：仅关心 debug/release 差异的场景。

### Option C
- 路径：纯 feature tag 方案（多个 `OS.has_feature`）。
- 优点：扩展到平台/架构分支更灵活。
- 缺点：规则复杂、误配风险上升。
- 适用：多平台细分策略项目。

## F015 - Release preflight regression strategy

### Option A (Recommended)
- 路径：固定 smoke 路径 + 关键系统检查清单 + 构建留档。
- 优点：流程可重复，回归成本可控。
- 缺点：需要团队纪律执行。
- 适用：准备对外发布的所有项目。

### Option B
- 路径：全靠人工自由探索回归。
- 优点：前期灵活。
- 缺点：覆盖不稳定，漏测概率高。
- 适用：非常早期原型。

### Option C
- 路径：自动化回归为主，人工抽样复核。
- 优点：长期效率高。
- 缺点：初期投入大，维护脚本成本高。
- 适用：中大型长期维护项目。

## F016 - Settings persistence strategy (`ConfigFile`)

### Option A (Recommended)
- 路径：`ConfigFile` 统一管理设置，变更后批量 `save`。
- 优点：结构清晰，易审计，兼容加密保存。
- 缺点：需要定义统一落盘时机。
- 适用：玩家设置/简单存档配置。

### Option B
- 路径：`FileAccess` 手写文本/二进制协议。
- 优点：格式完全可控。
- 缺点：协议维护成本高，兼容问题多。
- 适用：对格式有严格约束的系统。

### Option C
- 路径：内存态为主，关键节点才持久化。
- 优点：运行时开销低。
- 缺点：异常退出时数据丢失风险大。
- 适用：非关键配置项。

## F017 - Directory traversal determinism strategy

### Option A (Recommended)
- 路径：遍历后统一排序（字母/自然序），再驱动业务逻辑。
- 优点：跨平台结果稳定，可复现。
- 缺点：多一步排序成本。
- 适用：资源构建、回归测试、批处理流程。

### Option B
- 路径：依赖 `list_dir_begin` 原始顺序。
- 优点：实现最少。
- 缺点：跨系统不稳定，回归难复现。
- 适用：临时调试脚本。

### Option C
- 路径：使用约定命名（前缀编号）+ 排序。
- 优点：业务顺序可读、可控。
- 缺点：命名规范维护要求高。
- 适用：关卡/资源流水线。

## F018 - Runtime environment gating strategy

### Option A (Recommended)
- 路径：组合 `OS.has_feature("template")` + `OS.is_debug_build()` + 平台 feature tags。
- 优点：环境识别准确，分支可维护。
- 缺点：需要统一封装避免散落判断。
- 适用：导出包差异逻辑与诊断开关。

### Option B
- 路径：只看 `OS.is_debug_build()`。
- 优点：简单。
- 缺点：无法精确区分编辑器与模板运行。
- 适用：仅需 debug/release 差异。

### Option C
- 路径：全部依赖命令行参数切换。
- 优点：部署灵活。
- 缺点：易误配，线上可观测性差。
- 适用：内部工具链。

## F019 - Runtime FPS/V-Sync control strategy

### Option A (Recommended)
- 路径：启动期配置 `ProjectSettings`，运行期统一调用 `DisplayServer.window_set_vsync_mode` + `Engine.max_fps`。
- 优点：职责边界清晰，行为可预测。
- 缺点：需要封装一个统一时序入口。
- 适用：有画质/延迟切换选项的项目。

### Option B
- 路径：仅修改 `ProjectSettings` 项。
- 优点：开发期直观。
- 缺点：运行期不生效（启动后仅读）。
- 适用：只在启动前固定配置。

### Option C
- 路径：只控 `Engine.max_fps` 不控 V-Sync。
- 优点：实现简单。
- 缺点：可能与显示器刷新/撕裂策略冲突。
- 适用：快速实验。

## F020 - Release risk management strategy

### Option A (Recommended)
- 路径：风险矩阵（概率 x 影响）+ preflight 清单 + 回归留档三件套。
- 优点：发布决策透明，可追溯。
- 缺点：需要持续维护风险条目。
- 适用：准备对外发布阶段。

### Option B
- 路径：仅靠 preflight checklist。
- 优点：执行成本低。
- 缺点：缺风险优先级，资源分配粗糙。
- 适用：小团队轻量发布。

### Option C
- 路径：问题发生后再补救（reactive）。
- 优点：短期文档负担最低。
- 缺点：线上事故成本高。
- 适用：不建议作为长期策略。

## Evidence

- `godot/doc/classes/Node.xml` -> `_input`, `_unhandled_input`, `_unhandled_key_input`
- `godot/doc/classes/Node.xml` -> `_ready`, `request_ready`, `is_node_ready`, `process_priority`
- `godot/doc/classes/Camera2D.xml` -> `process_callback`, `get_screen_center_position`, `reset_smoothing`
- `godot/doc/classes/CharacterBody2D.xml` -> `move_and_slide`, `floor_snap_length`, `apply_floor_snap`
- `godot/doc/classes/ResourceLoader.xml` -> `load`, `load_threaded_request`, `load_threaded_get_status`, `CACHE_MODE_*`
- `godot/doc/classes/PackedScene.xml` -> `can_instantiate`, `instantiate`
- `godot/doc/classes/Performance.xml` -> `get_monitor`, `add_custom_monitor`, `TIME_*`, `RENDER_*`
- `godot/doc/classes/Engine.xml` -> `physics_ticks_per_second`, `max_physics_steps_per_frame`, `max_fps`
- `godot/doc/classes/ProjectSettings.xml` -> `editor/export/convert_text_resources_to_binary`
- `godot/doc/classes/OS.xml` -> `has_feature`, `is_debug_build`
- `godot/doc/classes/DisplayServer.xml` -> `screen_get_refresh_rate`
- `godot/doc/classes/DirAccess.xml` -> `list_dir_begin`, `get_files`, `get_directories`
- `godot/doc/classes/ConfigFile.xml` -> `set_value`, `save`, `save_encrypted`
- `godot/doc/classes/FileAccess.xml` -> export note and `flush`
- `godot/scene/2d/physics/character_body_2d.cpp` -> `CharacterBody2D::move_and_slide`, `CharacterBody2D::_apply_floor_snap`
- `godot/scene/2d/camera_2d.cpp` -> `Camera2D::_update_process_callback`, `Camera2D::reset_smoothing`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::queue_delete`, `SceneTree::_flush_delete_queue`
- `godot/core/io/resource_loader.cpp` -> `_load_start`, `load_threaded_get_status`
- `godot/scene/resources/packed_scene.cpp` -> `PackedScene::instantiate`
- `godot/main/performance.cpp` -> `Performance::get_monitor`
