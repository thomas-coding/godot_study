# Feature Option Playbook (Godot 4.6)

Last Updated: 2026-02-08
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

## F021 - Save settings format strategy

### Option A (Recommended)
- 路径：优先 `ConfigFile` 管理设置，统一落盘与迁移逻辑。
- 优点：结构清晰、可读性好、支持加密保存。
- 缺点：键命名规范要严格（不能有空格）。
- 适用：玩家设置与轻量配置。

### Option B
- 路径：`FileAccess` 自定义文本/二进制格式。
- 优点：协议自由度高。
- 缺点：维护与兼容成本高。
- 适用：需要严格格式控制的系统。

### Option C
- 路径：混合策略（关键配置 ConfigFile，性能敏感数据二进制）。
- 优点：兼顾可维护性与性能。
- 缺点：多协议并存增加复杂度。
- 适用：中后期项目。

## F022 - Resource enumeration strategy

### Option A (Recommended)
- 路径：资源遍历统一“采集 -> 排序 -> 处理”。
- 优点：跨平台结果稳定，回归可复现。
- 缺点：多一步排序成本。
- 适用：构建流程、批处理、自动化回归。

### Option B
- 路径：直接用 `list_dir_begin/get_next` 顺序驱动逻辑。
- 优点：代码最短。
- 缺点：顺序不稳定，跨平台差异大。
- 适用：临时调试脚本。

### Option C
- 路径：`ResourceLoader.list_directory` + 二次排序。
- 优点：可直接基于资源路径语义工作。
- 缺点：仍需自行保证排序与过滤一致。
- 适用：运行时资源发现系统。

## F023 - Runtime FPS cap control strategy

### Option A (Recommended)
- 路径：启动用 `application/run/max_fps`，运行时统一写 `Engine.max_fps`。
- 优点：时序清晰，行为可预测。
- 缺点：需要统一封装入口。
- 适用：支持运行时画质/延迟切换的项目。

### Option B
- 路径：运行时继续改 `ProjectSettings.application/run/max_fps`。
- 优点：实现直观。
- 缺点：运行时不生效。
- 适用：仅限启动前配置。

### Option C
- 路径：只依赖 V-Sync，不设 FPS cap。
- 优点：配置简单。
- 缺点：输入延迟与功耗策略不够可控。
- 适用：轻量项目。

## F024 - Runtime V-Sync control strategy

### Option A (Recommended)
- 路径：运行时统一 `DisplayServer.window_set_vsync_mode`，并处理不支持模式回退。
- 优点：可实时切换，平台行为可显式控制。
- 缺点：需处理 renderer/平台兼容分支。
- 适用：提供 V-Sync 选项的发布项目。

### Option B
- 路径：仅改 `ProjectSettings.display/window/vsync/vsync_mode`。
- 优点：配置入口统一。
- 缺点：启动后不生效。
- 适用：固定启动配置项目。

### Option C
- 路径：只在命令行切换 V-Sync。
- 优点：运维场景灵活。
- 缺点：用户侧不可见，调试成本高。
- 适用：内部诊断构建。

## F025 - Web persistence fallback strategy

### Option A (Recommended)
- 路径：启动检测 `OS.is_userfs_persistent()`，按结果启用/降级存档。
- 优点：行为透明，可提前规避数据丢失。
- 缺点：需要实现降级分支。
- 适用：Web 部署项目。

### Option B
- 路径：假设 `user://` 永久可用。
- 优点：实现简单。
- 缺点：在不持久环境下风险高。
- 适用：不建议用于正式发布。

### Option C
- 路径：本地持久化 + 云端同步双保险。
- 优点：可靠性最高。
- 缺点：实现复杂、需要服务端支持。
- 适用：长期运营项目。

## F026 - SceneTree group call timing strategy

### Option A (Recommended)
- 路径：批量调用默认使用 `GROUP_CALL_DEFERRED`，高频触发再叠加 `GROUP_CALL_UNIQUE`。
- 优点：降低同帧突发调用抖动，避免重复调度。
- 缺点：执行延后到消息队列，非即时语义。
- 适用：一帧内可能多次触发的广播逻辑。

### Option B
- 路径：使用 `GROUP_CALL_DEFAULT` 立即执行。
- 优点：语义直观，结果立刻可见。
- 缺点：大组调用可能导致卡顿。
- 适用：节点数量小、实时依赖强的场景。

### Option C
- 路径：立即调用 + 自己维护去重状态。
- 优点：行为完全可定制。
- 缺点：复杂度高，容易与引擎队列语义冲突。
- 适用：少量核心系统的高级优化。

## F027 - Group traversal order strategy

### Option A (Recommended)
- 路径：默认顺序，只有存在父子顺序依赖时启用 `GROUP_CALL_REVERSE`。
- 优点：保持大多数逻辑可读性，同时可局部修正时序。
- 缺点：需要识别哪些组有顺序依赖。
- 适用：中大型项目的稳定演进。

### Option B
- 路径：全量反向调用（统一 `GROUP_CALL_REVERSE`）。
- 优点：可快速消除部分父先子后的副作用。
- 缺点：会引入新的顺序假设，长期不可控。
- 适用：短期应急排障。

### Option C
- 路径：放弃 group 广播，改为显式拓扑顺序调用。
- 优点：顺序完全确定。
- 缺点：耦合度与维护成本上升。
- 适用：极端顺序敏感系统。

## F028 - PackedScene persistence boundary strategy

### Option A (Recommended)
- 路径：明确 owner 规则，保存前先校验关键节点 `Node.owner`。
- 优点：打包结果可预测，避免“丢子节点”事故。
- 缺点：需要额外的校验脚本或编辑规范。
- 适用：可编辑关卡、场景模板流程。

### Option B
- 路径：默认依赖编辑器当前 owner 状态，直接 pack。
- 优点：流程最短。
- 缺点：容易出现隐性遗漏，回归成本高。
- 适用：一次性原型。

### Option C
- 路径：pack 前自动重写 owner（工具脚本）。
- 优点：可批量修复历史资源。
- 缺点：工具错误会放大影响范围。
- 适用：遗留项目治理期。

## F029 - JSON robustness strategy

### Option A (Recommended)
- 路径：外部输入统一走 `JSON.parse`，失败时记录 `get_error_line/get_error_message`。
- 优点：诊断信息完整，线上问题可追踪。
- 缺点：样板代码略多。
- 适用：配置、存档、网络回包等关键路径。

### Option B
- 路径：全部使用 `JSON.parse_string`。
- 优点：代码简短。
- 缺点：失败诊断能力弱，排错效率低。
- 适用：临时脚本或可忽略失败的非关键输入。

### Option C
- 路径：先 `parse_string` 快判，失败再二次 `parse` 获取诊断。
- 优点：可在性能与诊断间折中。
- 缺点：代码路径更复杂。
- 适用：高频解析且需要降本的场景。

## F030 - Runtime viewport quality control strategy

### Option A (Recommended)
- 路径：运行时统一通过 `Viewport` setter 切换 AA/pixel-snap/debanding，并记录当前档位。
- 优点：可即时生效，便于做图形设置面板。
- 缺点：需要处理渲染器兼容差异（如 debanding 在 Compatibility 无效）。
- 适用：有用户图形选项的发布项目。

### Option B
- 路径：仅在 `ProjectSettings` 设置默认值，不做运行时切换。
- 优点：实现简单，行为稳定。
- 缺点：用户不可动态调整。
- 适用：固定硬件目标、轻量项目。

### Option C
- 路径：直接调用 `RenderingServer.viewport_set_*` 做低层封装。
- 优点：控制粒度最高。
- 缺点：业务层与底层耦合更重。
- 适用：已有统一渲染中间层的工程。

## F031 - Scene transition entrypoint strategy

### Option A (Recommended)
- 路径：常规切场景优先 `change_scene_to_file/packed`，切换后统一等待 `scene_changed` 再访问新场景节点。
- 优点：语义稳定，和 SceneTree 两阶段切换机制一致。
- 缺点：需要把“切换后初始化”改写为信号驱动。
- 适用：大多数 gameplay 场景流转。

### Option B
- 路径：用 `change_scene_to_node` 手动构造新场景后切换。
- 优点：切换前可先注入依赖与初始状态。
- 缺点：生命周期管理更复杂，误用容易悬挂引用。
- 适用：需要预配置场景实例的系统。

### Option C
- 路径：不走 SceneTree change API，手动 `remove_child/add_child` 管理。
- 优点：流程完全可控。
- 缺点：容易偏离引擎默认安全语义，维护风险高。
- 适用：少量特殊框架层。

## F032 - Post-scene-switch synchronization strategy

### Option A (Recommended)
- 路径：统一监听 `scene_changed` 作为“新场景可用”锚点。
- 优点：避免 current_scene 窗口期空值问题。
- 缺点：需要重构部分同步初始化代码。
- 适用：需要稳定跨场景初始化的项目。

### Option B
- 路径：切换后 `await get_tree().process_frame` 再访问。
- 优点：改动小，快速修复时序错误。
- 缺点：语义隐式，后续维护可读性一般。
- 适用：临时修复或小项目。

### Option C
- 路径：主动轮询 `get_tree().current_scene != null`。
- 优点：实现直观。
- 缺点：轮询开销和异常分支多，不优雅。
- 适用：不推荐，除非调试验证。

## F033 - Delay/timer implementation strategy

### Option A (Recommended)
- 路径：一次性延时优先 `SceneTree.create_timer`，并明确 `process_in_physics` 语义。
- 优点：轻量，无需常驻节点，顺序语义与引擎一致。
- 缺点：不适合复杂重复计时。
- 适用：技能冷却、短延迟触发。

### Option B
- 路径：使用常驻 `Timer` 节点管理重复或可视化计时。
- 优点：编辑器可见、可配置、可复用。
- 缺点：节点数量增多后维护成本上升。
- 适用：周期事件与设计师可调参数场景。

### Option C
- 路径：手写 delta 累加器。
- 优点：控制最细。
- 缺点：容易出现时序漂移或重复造轮子。
- 适用：极少数需要自定义积分行为的逻辑。

## F034 - JSON resource robustness strategy (editor/runtime)

### Option A (Recommended)
- 路径：把 JSON 资源加载分成 editor/runtime 两条错误处理路径，发布前按 runtime 规则做硬校验。
- 优点：能提前发现“编辑器可用但运行失败”的隐患。
- 缺点：需要增加 CI 或预发布校验步骤。
- 适用：配置驱动与内容驱动项目。

### Option B
- 路径：只在编辑器里人工打开检查 JSON。
- 优点：流程简单。
- 缺点：无法覆盖 runtime 严格失败分支。
- 适用：非常小的原型项目。

### Option C
- 路径：业务层统一把 JSON 当文本处理，绕开资源系统。
- 优点：可自定义容错策略。
- 缺点：放弃引擎资源链路，工程成本更高。
- 适用：有强定制需求的工具链。

## F035 - Release regression evidence capture strategy

### Option A (Recommended)
- 路径：每次回归都写入“构建身份 + 命令参数 + 指标快照”三元组，并沉淀到 `artifacts/*.json`。
- 优点：可追溯、可比较、可审计。
- 缺点：需要维护命名规范与样本清理策略。
- 适用：准备持续发布的项目。

### Option B
- 路径：只保留 checklist 勾选结果，不保存指标文件。
- 优点：执行负担最低。
- 缺点：无法做趋势分析，复盘证据弱。
- 适用：短期演示发布。

### Option C
- 路径：只做临时口头/聊天记录，不留结构化产物。
- 优点：即时。
- 缺点：几乎不可复用，不适合作为发布门禁。
- 适用：不建议作为正式流程。

## F036 - Signal connection lifetime strategy

### Option A (Recommended)
- 路径：默认先 `is_connected()` 再 connect；需要重复订阅时显式使用 `CONNECT_REFERENCE_COUNTED`。
- 优点：避免重复连接报错，同时保留可控的引用计数断开语义。
- 缺点：需要团队统一连接约定。
- 适用：中大型项目事件系统。

### Option B
- 路径：所有连接都用普通 `connect`，重复连接直接视为 bug。
- 优点：规则简单，问题暴露早。
- 缺点：动态装配场景容易误报或增加样板判断。
- 适用：结构简单且连接点固定的项目。

### Option C
- 路径：所有连接都强制 `CONNECT_REFERENCE_COUNTED`。
- 优点：不会因为重复连接直接抛错。
- 缺点：容易把连接泄漏隐藏成“计数未归零”问题。
- 适用：不推荐作为全局默认。

## F037 - Deferred callback scheduling strategy

### Option A (Recommended)
- 路径：信号级延迟用 `CONNECT_DEFERRED`，单次方法延迟用 `call_deferred`，下一帧一次性回调用 `process_frame + CONNECT_ONE_SHOT`。
- 优点：语义清晰，能区分连接策略与调用策略。
- 缺点：需要开发者理解三者时序差异。
- 适用：高频事件与时序敏感逻辑并存的项目。

### Option B
- 路径：统一只用 `call_deferred`。
- 优点：上手快。
- 缺点：无法表达“连接层的长期 deferred 语义”。
- 适用：小规模项目的临时方案。

### Option C
- 路径：统一即时调用，不使用 deferred。
- 优点：执行路径最短。
- 缺点：容易触发重入/同帧状态竞争。
- 适用：仅限确定无时序风险的简单逻辑。

## F038 - GUI event propagation strategy

### Option A (Recommended)
- 路径：UI 控件默认 `MOUSE_FILTER_STOP`，业务层在 `_gui_input` 明确决定是否 `accept_event()`。
- 优点：输入边界清楚，能稳定避免 UI 与 gameplay 抢事件。
- 缺点：需要逐控件审查是否误吞输入。
- 适用：有复杂 HUD/菜单交互的项目。

### Option B
- 路径：大量使用 `MOUSE_FILTER_PASS`，依赖父链处理。
- 优点：组合灵活。
- 缺点：冒泡链复杂，排错成本高。
- 适用：层级简单且可控的 UI 树。

### Option C
- 路径：覆盖性 UI 全设 `MOUSE_FILTER_IGNORE`，把输入完全透给下层。
- 优点：不会阻断 gameplay 输入。
- 缺点：控件失去鼠标交互能力。
- 适用：纯展示层（装饰/遮罩）节点。

## F039 - Pause architecture strategy

### Option A (Recommended)
- 路径：统一按系统类型设置 `Node.process_mode`，并显式区分暂停期间继续运行的 UI/系统节点。
- 优点：暂停语义可预测，`can_process()` 结果稳定。
- 缺点：需要建立节点分类规范。
- 适用：包含菜单、战斗、过场等多状态项目。

### Option B
- 路径：全局 `SceneTree.paused=true` 后只靠少量手动开关恢复。
- 优点：实现简单。
- 缺点：容易遗漏节点，出现“该停不停/该跑不跑”。
- 适用：小项目快速迭代。

### Option C
- 路径：不使用 paused，改为自建全局 time-scale/state gate。
- 优点：控制粒度高。
- 缺点：脱离引擎默认流程，维护复杂。
- 适用：强定制框架。

## F040 - Regression threshold governance strategy

### Option A (Recommended)
- 路径：回归样本达到 5 次后，按关键指标生成 `mean +/- 15%` 阈值带并写入 artifacts。
- 优点：发布门禁从“主观判断”升级为“可追踪阈值”。
- 缺点：仍需定期重算阈值以适应硬件/内容变化。
- 适用：进入持续发布阶段的项目。

### Option B
- 路径：只保留原始样本，不生成阈值带。
- 优点：记录真实，不引入阈值维护成本。
- 缺点：无法自动判定回归是否越界。
- 适用：早期探索阶段。

### Option C
- 路径：人工经验阈值，不绑定样本统计。
- 优点：配置快。
- 缺点：解释性弱，团队共识成本高。
- 适用：短期临时项目。

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
- `godot/doc/classes/ResourceLoader.xml` -> `list_directory`
- `godot/doc/classes/SceneTree.xml` -> `call_group_flags`, `notify_group_flags`, `GROUP_CALL_*`
- `godot/doc/classes/SceneTree.xml` -> `change_scene_to_node`, `scene_changed`, `create_timer`
- `godot/doc/classes/PackedScene.xml` -> `pack`, `Node.owner`
- `godot/doc/classes/JSON.xml` -> `parse`, `parse_string`, `get_error_line`, `get_error_message`
- `godot/doc/classes/JSON.xml` -> `get_parsed_text`, `parse(keep_text)`
- `godot/doc/classes/Object.xml` -> `connect`, `set_block_signals`, `CONNECT_DEFERRED`, `CONNECT_ONE_SHOT`, `CONNECT_REFERENCE_COUNTED`
- `godot/doc/classes/Control.xml` -> `_gui_input`, `accept_event`, `MOUSE_FILTER_*`
- `godot/doc/classes/Viewport.xml` -> `msaa_*`, `screen_space_aa`, `use_taa`, `use_debanding`, `snap_2d_*`
- `godot/scene/2d/physics/character_body_2d.cpp` -> `CharacterBody2D::move_and_slide`, `CharacterBody2D::_apply_floor_snap`
- `godot/scene/2d/camera_2d.cpp` -> `Camera2D::_update_process_callback`, `Camera2D::reset_smoothing`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::queue_delete`, `SceneTree::_flush_delete_queue`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::call_group_flagsp`, `SceneTree::notify_group_flags`
- `godot/scene/main/scene_tree.cpp` -> `SceneTree::change_scene_to_file`, `SceneTree::change_scene_to_node`, `SceneTree::process`, `process_timers`
- `godot/core/io/resource_loader.cpp` -> `_load_start`, `load_threaded_get_status`
- `godot/core/object/object.cpp` -> `Object::connect`, `Object::emit_signalp`, `Object::_disconnect`
- `godot/core/io/json.cpp` -> `JSON::parse`, `JSON::parse_string`
- `godot/core/io/json.cpp` -> `ResourceFormatLoaderJSON::load`, `ResourceFormatSaverJSON::save`
- `godot/scene/resources/packed_scene.cpp` -> `PackedScene::instantiate`
- `godot/scene/resources/packed_scene.cpp` -> `SceneState::pack`, `SceneState::_parse_node`
- `godot/main/performance.cpp` -> `Performance::get_monitor`
- `godot/scene/main/viewport.cpp` -> `Viewport::set_msaa_2d`, `set_screen_space_aa`, `set_use_taa`, `set_use_debanding`
- `godot/scene/main/viewport.cpp` -> `Viewport::_gui_call_input`, `Viewport::set_input_as_handled`
- `godot/scene/main/node.cpp` -> `Node::can_process`, `Node::_can_process`, `Node::set_process_input`
- `godot/servers/rendering/rendering_server.h` -> `viewport_set_msaa_2d`, `viewport_set_use_taa`, `viewport_set_use_debanding`
- `02_mentor/automated_regression_spec_v1.md` -> run profile + minimum metrics + storage convention
- `02_mentor/artifacts/rrb_threshold_band_v1.json` -> threshold band metrics from 5-run baseline
