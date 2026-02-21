# Docs Digest

> 规则：每次教学前后补充 1-2 条，记录“读了什么 -> 结论是什么 -> 来源在哪里”。

## 2026-02-21

- Topic: 学员线第7~第9课实作验收（Working）
- Summary:
  - 第7课完成：`Camera2D` 跟随与 smoothing 参数基线验证。
  - 第8课完成：`Main` 从多布尔门控重构为单状态机门控。
  - 第9课完成：UI 迁移到 `HUD(CanvasLayer)`，并通过统一接口更新分数/血量/状态提示。
  - 关键回归通过：start/play/pause/restart + game over/win 全链路无回归。
- Source:
  - `projects/first-game/scenes/player.tscn`
  - `projects/first-game/scenes/main.gd`
  - `projects/first-game/scenes/main.tscn`
  - `projects/first-game/scenes/hud.tscn`
  - `projects/first-game/scenes/hud.gd`
  - `01_learner/daily_reports/2026-02-21.md`

- Topic: 导师线备课补齐（第10课/第11课/第12课）与三课缓冲恢复（Working）
- Summary:
  - 根据学员线已推进到第9课，补齐第10~第12课 runbook。
  - 第10课聚焦敌人巡逻与接触伤害，第11课聚焦收集目标门控，第12课聚焦关卡切换。
  - `lesson_queue` 已恢复到 `第10课~第12课` 三课缓冲，满足“至少提前 3 课”要求。
  - 导师线触发词补充 `你备下课/备课`，用于学员线结束后的备课切换。
  - 保持学员线不中断原则：仅在用户明确触发导师线时执行备课。
- Source:
  - `00_plan/lesson_queue.md`
  - `00_plan/lesson_10_2h_runbook.md`
  - `00_plan/lesson_11_2h_runbook.md`
  - `00_plan/lesson_12_2h_runbook.md`
  - `03_sessions/session_protocol.md`
  - `00_meta/dual_track_governance.md`

## 2026-02-20

- Topic: 学员线第4~第6课实作验收（Working）
- Summary:
  - 第4课完成：`start_game` 入口门控 + `StartLabel`，并完成 `layer/mask` 约定落地。
  - 第5课完成：`Hazard(Area2D)` 伤害触发 + `hp` 递减 + `GAME OVER` 状态门控。
  - 第6课完成：`Goal(Area2D)` 胜利触发 + `YOU WIN` 终态门控 + 重开恢复。
  - 全链路回归通过：start/play、collect/score、pause/resume、game over、win、restart。
- Source:
  - `projects/first-game/scenes/main.gd`
  - `projects/first-game/scenes/main.tscn`
  - `projects/first-game/scenes/hazard.gd`
  - `projects/first-game/scenes/hazard.tscn`
  - `projects/first-game/scenes/goal.gd`
  - `projects/first-game/scenes/goal.tscn`
  - `01_learner/daily_reports/2026-02-20.md`

- Topic: 学员线课次制改造与三课备课缓冲（Working）
- Summary:
  - 学习计划从“按天推进”改为“按课次推进”，每课默认 2h，可单日多课或零课。
  - 学员触发词扩展为 `继续学/学下一课/第X课`，默认按 `lesson_queue` 跳转到下一课。
  - 导师线新增硬约束：持续维护至少 3 课可执行 runbook 缓冲。
  - 已新增第4~第6课 runbook，满足当前三课缓冲要求。
- Source:
  - `AGENTS.md`
  - `03_sessions/session_protocol.md`
  - `00_meta/dual_track_governance.md`
  - `00_plan/lesson_queue.md`
  - `00_plan/lesson_04_2h_runbook.md`
  - `00_plan/lesson_05_2h_runbook.md`
  - `00_plan/lesson_06_2h_runbook.md`

## 2026-02-19

- Topic: 学员线 Day3 `Area2D` 最小玩法闭环验收（Working）
- Summary:
  - 完成 `Coin(Area2D)` 可收集交互：`body_entered` 触发后发射 `collected` 并 `queue_free`。
  - 完成 `Main` 侧计数聚合：`collected_count` 随收集增长，控制台与 `ScoreLabel` 同步更新。
  - 运行验收通过：碰撞触发正常、收集物回收正常、计数反馈正常、无红色报错。
  - 补了临时可视化处理：缩小 `icon.svg` 精灵缩放并调整碰撞半径，避免“巨型 coin”影响教学。
- Source:
  - `00_plan/day_03_2h_runbook.md`
  - `projects/first-game/scenes/coin.tscn`
  - `projects/first-game/scenes/coin.gd`
  - `projects/first-game/scenes/main.gd`
  - `projects/first-game/scenes/main.tscn`
  - `01_learner/daily_reports/2026-02-19.md`

- Topic: 学员线 Day3 扩展验收（restart + pause 语义修复）（Working）
- Summary:
  - 新增 `restart` 行为：`R` 触发 `reload_current_scene`，可正确恢复 coin 并重置计数。
  - 新增 `pause_toggle` 行为：`P` 控制 `SceneTree.paused`，`PauseLabel` 同步显示。
  - 发现并修复“暂停不生效”根因：`Player` 继承了 `Main` 的 `PROCESS_MODE_ALWAYS`。
  - 修复策略：`Main` 保持 `ALWAYS` 以接收热键，`Player/Coin` 显式设为 `PROCESS_MODE_PAUSABLE`。
- Source:
  - `godot/doc/classes/Node.xml`
  - `godot/doc/classes/SceneTree.xml`
  - `projects/first-game/scenes/main.gd`
  - `projects/first-game/scenes/main.tscn`
  - `projects/first-game/scenes/player.gd`
  - `01_learner/daily_reports/2026-02-19.md`

- Topic: 第4课教学准备：输入链路与 pause/restart 机制固化（Verified）
- Summary:
  - 新增 M13，补齐 `Viewport` 输入传播顺序、`set_input_as_handled` 阻断语义、`SceneTree._call_input_pause` 与 `Node.can_process` 的联动机制。
  - 新增 K052~K056 与 QA051~QA055，覆盖“热键重复触发”“暂停显示但角色仍移动”“重开重置范围”等明日课堂高频问题。
  - source quick-answer map 扩展到 100（SQ91~SQ100），feature playbook 扩展到 F050（输入路由、暂停架构、重开策略、start gate、layer/mask 治理）。
  - 新增第4课 runbook 与专用排错清单，可直接用于明日学员线课堂。
- Source:
  - `godot/doc/classes/Node.xml`
  - `godot/doc/classes/SceneTree.xml`
  - `godot/doc/classes/Viewport.xml`
  - `godot/scene/main/node.cpp`
  - `godot/scene/main/scene_tree.cpp`
  - `godot/scene/main/viewport.cpp`
  - `02_mentor/modules/M13_input_dispatch_pause_gates_and_scene_reload_semantics.md`
  - `02_mentor/source_quick_answer_map_v1.md`
  - `02_mentor/feature_option_playbook.md`
  - `00_plan/lesson_04_2h_runbook.md`
  - `04_templates/gameplay_state_pause_restart_troubleshooting_checklist.md`

## 2026-02-18

- Topic: 双轨长期治理规则固化（Working）
- Summary:
  - 把“学员线 + 导师线”长期协作模式固化为项目级协议文件，避免流程漂移。
  - 明确轨道判定与默认优先级：歧义默认学员线，切轨必须显式声明。
  - 学员课SOP固定为“回顾 -> 目标 -> runbook -> 验收 -> 修复 -> 收尾”，导师线增加“先给学员下节计划”的强制责任。
  - 更新启动与会话协议，确保下一个 AI 能直接按稳定流程接管。
- Source:
  - `00_meta/dual_track_governance.md`
  - `AGENTS.md`
  - `03_sessions/session_protocol.md`
  - `00_plan/week_01_bootstrap.md`
  - `03_sessions/handoff_latest.md`

- Topic: 学员线 Day2 最小可玩实作验收（Working）
- Summary:
  - 学员完成 `CharacterBody2D` 最小可玩：A/D 左右移动 + Space 跳跃 + 地面碰撞。
  - 采用 `Main`（关卡容器）+ `Player`（可复用子场景）结构，形成后续扩展基础。
  - 运行时验收通过，无红色报错；当前通过可见碰撞形状辅助观察地面。
- Source:
  - `00_plan/day_02_2h_runbook.md`
  - `projects/first-game/scenes/main.tscn`
  - `projects/first-game/scenes/player.tscn`
  - `projects/first-game/scenes/player.gd`
  - `01_learner/daily_reports/2026-02-18.md`

- Topic: Day3 交互课前教师自学习（Area2D）准备完成（Verified）
- Summary:
  - 新增 M12，补齐 `Area2D` 触发时序、`monitoring/monitorable` 语义、layer/mask 检测门槛、`queue_free` 帧尾删除链路。
  - 新增 K047~K051 与 QA046~QA050，覆盖“碰到了不触发”“回调里切 monitoring 报错”“shape index 定位具体碰撞体”等高频疑问。
  - 新增 Day3 runbook 与排错清单，明日学员课可直接按固定SOP执行。
  - quick-answer map 扩展到 90，playbook 扩展到 F045。
- Source:
  - `godot/doc/classes/Area2D.xml`
  - `godot/doc/classes/CollisionObject2D.xml`
  - `godot/doc/classes/Node.xml`
  - `godot/scene/2d/physics/area_2d.cpp`
  - `godot/scene/2d/physics/collision_object_2d.cpp`
  - `godot/scene/main/scene_tree.cpp`
  - `02_mentor/modules/M12_area2d_collision_layers_and_interaction_flow.md`
  - `02_mentor/source_quick_answer_map_v1.md`
  - `02_mentor/feature_option_playbook.md`
  - `00_plan/day_03_2h_runbook.md`
  - `04_templates/area2d_interaction_troubleshooting_checklist.md`

## 2026-02-08

- Topic: 信号派发与 GUI 输入链路深潜（Verified）
- Summary:
  - 新增 M11，补齐 `connect` 重复连接、`CONNECT_ONE_SHOT`/`CONNECT_DEFERRED` 派发语义、`set_block_signals` 行为、`Control` 输入链路与 `accept_event` 阻断机制。
  - 新增 K042~K046 与 QA041~QA045，形成“信号时序 + UI 冒泡 + paused 处理”可教学闭环。
  - quick-answer map 从 70 扩展到 80（SQ71~SQ80），重点补足 Signal/Control/Node pause 场景的源码快答入口。
- Source:
  - `godot/doc/classes/Object.xml`
  - `godot/core/object/object.cpp`
  - `godot/doc/classes/Control.xml`
  - `godot/scene/gui/control.cpp`
  - `godot/scene/main/viewport.cpp`
  - `godot/doc/classes/Node.xml`
  - `godot/scene/main/node.cpp`
  - `godot/doc/classes/SceneTree.xml`
  - `godot/scene/main/scene_tree.cpp`
  - `02_mentor/modules/M11_signal_gui_input_and_pause_aware_processing.md`
  - `02_mentor/source_quick_answer_map_v1.md`

- Topic: 发布回归阈值带基线建立（Verified/Working）
- Summary:
  - 新增 RRB-004 与 RRB-005，真实构建样本累计到 5 条（RRB-001~RRB-005）。
  - 生成 `rrb_threshold_band_v1.json`，把核心启动指标与 quickstart 延迟转为 `mean +/- 15%` 门禁带。
  - playbook 从 F035 扩展到 F040，并把阈值治理写入自动回归规范。
- Source:
  - `02_mentor/artifacts/rrb004_headless_quickstart_3runs.json`
  - `02_mentor/artifacts/rrb005_benchmark_stdout_parsed.json`
  - `02_mentor/artifacts/rrb_threshold_band_v1.json`
  - `02_mentor/release_rehearsal_samples_v1.md`
  - `02_mentor/automated_regression_spec_v1.md`
  - `02_mentor/feature_option_playbook.md`
  - `02_mentor/mentor_progress_dashboard.md`

## 2026-02-07

- Topic: 知识库版本化治理落地（Working）
- Summary:
  - 新增版本注册表、迁移协议、兼容矩阵三件套，支持长期跨版本维护。
  - 触发词“更新知识库到godot X.Y”已接入启动协议与会话协议。
  - 现有模块/卡片/问答已补充版本字段，后续可按矩阵做增量迁移。
- Source:
  - `AGENTS.md`
  - `00_meta/version_registry.md`
  - `00_meta/version_upgrade_protocol.md`
  - `02_mentor/indexes/version_matrix.md`

- Topic: 导师愿景与自学习计划固化（Working）
- Summary:
  - 明确导师目标：成为 Godot 专家型指导老师，支持快速、正确、可验证的解答。
  - 新增默认回答规范：feature 提供多方案 trade-off，源码问题给函数链路与证据。
  - 新增触发词：`你自己学习 / 你先学习`，可按固定计划执行导师自学习。
- Source:
  - `02_mentor/mentor_vision_and_self_study_plan.md`
  - `02_mentor/expert_study_protocol.md`
  - `AGENTS.md`

- Topic: 导师能力量化看板上线（Working）
- Summary:
  - 新增 5 维度量化模型与总百分比计算规则（当前 22%）。
  - 新增 12 周周目标与每次导师学习后的自动更新规则。
  - 后续可持续追踪“专家型导师”愿景达成进度。
- Source:
  - `02_mentor/mentor_progress_dashboard.md`
  - `03_sessions/session_protocol.md`

- Topic: CharacterBody2D Day2 教学清单与排错模板（Verified）
- Summary:
  - 补齐了 Day2 最小可玩实现的教学顺序：更新 velocity -> move_and_slide -> 读取 is_on_floor。
  - 明确了两个高频坑：`velocity` 单位是 px/s（不要再乘 delta）、`is_on_floor` 是运动后状态。
  - 新增可复用排错模板，覆盖输入、重力、碰撞、贴地与时序问题。
- Source:
  - `godot/doc/classes/CharacterBody2D.xml`
  - `godot/scene/2d/physics/character_body_2d.cpp`
  - `02_mentor/modules/M05_characterbody2d_movement_basics.md`
  - `04_templates/characterbody2d_day2_troubleshooting_checklist.md`

- Topic: 回调与删除时序问答扩展（Verified）
- Summary:
  - `queue_free` 被确认是“入删除队列 -> 帧尾 flush”语义，不是立即销毁。
  - 新增 physics delta 与 step cap 问答，解释低帧率下 delta 与真实秒数偏差。
  - QA 资产从 QA003 扩展到 QA007，覆盖 Day2 常见疑问。
- Source:
  - `godot/scene/main/scene_tree.cpp`
  - `godot/main/main.cpp`
  - `godot/doc/classes/Node.xml`
  - `02_mentor/qa/QA004_queue_free_not_immediate.md`
  - `02_mentor/qa/QA005_physics_delta_and_step_cap.md`

- Topic: Feature 多方案对比库 v1（Working）
- Summary:
  - 新增 playbook，首批覆盖输入采样策略与坡面贴地策略两类 feature。
  - 每个 feature 提供 2-3 个方案及优缺点/适用场景，提升指导速度与正确率。
- Source:
  - `02_mentor/feature_option_playbook.md`
  - `godot/doc/classes/Node.xml`
  - `godot/doc/classes/CharacterBody2D.xml`

- Topic: Camera2D 跟随抖动诊断（Verified）
- Summary:
  - `Camera2D` 的跟随抖动常见于 callback 域不一致（player 在 physics，camera 在 idle 或反向）。
  - 实际屏幕中心需用 `get_screen_center_position()` 诊断，不能只看 `global_position`。
  - 参数修改后可用 `reset_smoothing()` / `force_update_scroll()` 做立即收敛验证。
- Source:
  - `godot/doc/classes/Camera2D.xml`
  - `godot/scene/2d/camera_2d.cpp`
  - `02_mentor/modules/M06_camera_follow_and_jitter_diagnosis.md`

- Topic: Node 复用与 `_ready` 生命周期（Verified）
- Summary:
  - `_ready` 默认对同一实例只触发一次。
  - 复用节点并重新初始化时，应在重新加入树前调用 `request_ready()`。
- Source:
  - `godot/doc/classes/Node.xml`
  - `godot/scene/main/node.cpp`
  - `02_mentor/qa/QA009_ready_not_called_again.md`

- Topic: 源码快答映射表 v1（Working）
- Summary:
  - 已建立 10 个高频问题到源码入口的映射（类 -> 函数链路 -> 证据）。
  - 可用于 5 分钟内输出“结论 + 证据 + 验证步骤”的源码答疑。
- Source:
  - `02_mentor/source_quick_answer_map_v1.md`

- Topic: 资源加载与实例化链路（Verified）
- Summary:
  - `ResourceLoader.load` 默认复用缓存；线程加载需“先 status 再 get”，否则可能阻塞。
  - `PackedScene.instantiate` 会发送 `NOTIFICATION_SCENE_INSTANTIATED`，可作为实例化后初始化锚点。
  - 已补齐 M07、K011~K013、QA011~QA012 作为教学资产。
- Source:
  - `godot/doc/classes/ResourceLoader.xml`
  - `godot/core/io/resource_loader.cpp`
  - `godot/doc/classes/PackedScene.xml`
  - `godot/scene/resources/packed_scene.cpp`

- Topic: 性能监视与帧预算基线（Verified）
- Summary:
  - 建立“先判域后优化”流程：先看 `TIME_PROCESS` / `TIME_PHYSICS_PROCESS` / `RENDER_TOTAL_DRAW_CALLS_IN_FRAME`。
  - 明确 release 导出下部分 monitor 固定为 0 的限制，避免误判。
  - 已补齐 M08、K014~K016、QA013~QA014 与性能排查 checklist。
- Source:
  - `godot/doc/classes/Performance.xml`
  - `godot/main/performance.cpp`
  - `godot/doc/classes/Engine.xml`
  - `godot/doc/classes/Time.xml`
  - `04_templates/performance_frame_budget_checklist.md`

- Topic: 导出运行时资源加载风险（Verified）
- Summary:
  - 导出后运行时加载差异需重点核查 `editor/export/convert_text_resources_to_binary`。
  - 补齐导出运行时加载 checklist 与 QA015，形成 D5 基础资产。
- Source:
  - `godot/doc/classes/ResourceLoader.xml`
  - `godot/doc/classes/ProjectSettings.xml`
  - `04_templates/export_runtime_resource_loading_checklist.md`
  - `02_mentor/qa/QA015_runtime_load_in_export_fail.md`

- Topic: Runtime 指标与构建形态识别扩展（Verified）
- Summary:
  - 补充了 debug/release 指标可见性、`TIME_FPS` 更新节奏、`OS.has_feature("template")` 判定等高频结论。
  - 新增 K017~K021 与 QA016~QA020，覆盖性能观测、缓存语义、VSync/FPS 联动与运行态识别。
- Source:
  - `godot/doc/classes/Performance.xml`
  - `godot/doc/classes/OS.xml`
  - `godot/doc/classes/Engine.xml`
  - `godot/doc/classes/ProjectSettings.xml`
  - `godot/doc/classes/DisplayServer.xml`

- Topic: 多方案与快答图谱扩展（Working）
- Summary:
  - feature playbook 从 F010 扩展到 F015，补齐 runtime metrics、threaded loading depth、release preflight 策略。
  - source quick-answer map 从 20 扩展到 30，形成更高覆盖率源码答疑入口。
- Source:
  - `02_mentor/feature_option_playbook.md`
  - `02_mentor/source_quick_answer_map_v1.md`

- Topic: D4/D5 实战资产补全（Working）
- Summary:
  - 新增性能案例库 v1（3 cases），覆盖 physics 慢动作、渲染峰值、线程加载卡顿。
  - 新增 Windows 发布前回归清单，形成发布前最小可执行检查路径。
- Source:
  - `02_mentor/performance_casebook_v1.md`
  - `04_templates/windows_release_preflight_checklist.md`

- Topic: 配置与文件系统稳定性细节扩展（Verified）
- Summary:
  - 补齐了 `ConfigFile` 持久化、`DirAccess` 顺序不稳定、`FileAccess` 导出资源读取限制等易踩坑。
  - 新增 K022~K026 与 QA021~QA025，覆盖 V-Sync 运行时变更、user:// 持久化与导出差异。
- Source:
  - `godot/doc/classes/ConfigFile.xml`
  - `godot/doc/classes/DirAccess.xml`
  - `godot/doc/classes/FileAccess.xml`
  - `godot/doc/classes/OS.xml`
  - `godot/doc/classes/DisplayServer.xml`

- Topic: 决策资产与快答图谱扩容（Working）
- Summary:
  - playbook 从 F015 扩展到 F020，新增设置持久化、遍历确定性、运行态判定、发布风险管理策略。
  - source quick-answer map 从 30 扩展到 40，提升发布链路与配置问题答疑覆盖率。
- Source:
  - `02_mentor/feature_option_playbook.md`
  - `02_mentor/source_quick_answer_map_v1.md`

- Topic: 发布治理资产补全（Working）
- Summary:
  - 新增发布风险矩阵 v1（概率 x 影响）与自动化回归规范 v1（指标/流程/门禁）。
  - 导师能力看板更新到 48%，进入“可教学后期”阶段。
- Source:
  - `02_mentor/release_risk_matrix_v1.md`
  - `02_mentor/automated_regression_spec_v1.md`
  - `02_mentor/mentor_progress_dashboard.md`

- Topic: 帧率/V-Sync/持久化高频坑扩展（Verified）
- Summary:
  - 新增 K027~K031 与 QA026~QA030，覆盖 startup-only 设置、V-Sync 运行时入口、ConfigFile 命名/落盘、flush 策略、Web 持久化降级。
  - 强化了“启动期设置 vs 运行时 API”边界，减少配置错觉导致的问题。
- Source:
  - `godot/doc/classes/ProjectSettings.xml`
  - `godot/doc/classes/Engine.xml`
  - `godot/doc/classes/DisplayServer.xml`
  - `godot/doc/classes/ConfigFile.xml`
  - `godot/doc/classes/FileAccess.xml`
  - `godot/doc/classes/OS.xml`

- Topic: 决策与快答资产继续扩容（Working）
- Summary:
  - feature playbook 从 F020 扩展到 F025，补齐设置持久化、遍历确定性、运行态与 Web 持久化策略。
  - source quick-answer map 从 40 扩展到 50，增强导出与运行态问题的快速定位能力。
- Source:
  - `02_mentor/feature_option_playbook.md`
  - `02_mentor/source_quick_answer_map_v1.md`

- Topic: 发布治理闭环样本补齐（Working）
- Summary:
  - 新增 `release_rehearsal_samples_v1.md`（3 个演练样本），并回链到风险矩阵。
  - 导师能力看板更新到 52%，进入“进阶导师早期”。
- Source:
  - `02_mentor/release_rehearsal_samples_v1.md`
  - `02_mentor/release_risk_matrix_v1.md`
  - `02_mentor/mentor_progress_dashboard.md`

- Topic: SceneTree/持久化边界/运行时渲染控制扩展（Verified）
- Summary:
  - 新增 M09，打通 group-call 编排、PackedScene owner 持久化边界、JSON 解析健壮性、Viewport 运行时画质控制。
  - 新增 K032~K036 与 QA031~QA035，补齐 `GROUP_CALL_UNIQUE`、`GROUP_CALL_REVERSE`、`pack(owner)`、`JSON.parse` 诊断、Viewport AA/pixel-snap 运行时入口。
  - quick-answer map 从 50 扩展到 60（SQ51~SQ60），playbook 从 F025 扩展到 F030，导师能力看板更新到 56%。
- Source:
  - `godot/doc/classes/SceneTree.xml`
  - `godot/scene/main/scene_tree.cpp`
  - `godot/doc/classes/PackedScene.xml`
  - `godot/scene/resources/packed_scene.cpp`
  - `godot/doc/classes/JSON.xml`
  - `godot/core/io/json.cpp`
  - `godot/doc/classes/Viewport.xml`
  - `godot/scene/main/viewport.cpp`
  - `godot/servers/rendering/rendering_server.h`
  - `02_mentor/modules/M09_scenetree_persistence_and_runtime_render_controls.md`
  - `02_mentor/source_quick_answer_map_v1.md`
  - `02_mentor/feature_option_playbook.md`
  - `02_mentor/mentor_progress_dashboard.md`

- Topic: Scene 切换时序与真实构建回归证据扩展（Verified/Working）
- Summary:
  - 新增 M10，补齐 `change_scene` 两阶段提交、`scene_changed` 同步锚点、`create_timer` 更新顺序、JSON 资源 editor/runtime 分支与保存语义。
  - 新增 K037~K041 与 QA036~QA040，形成场景切换和 JSON 资源行为的教学闭环。
  - quick-answer map 从 60 扩展到 70（SQ61~SQ70），playbook 从 F030 扩展到 F035。
  - 发布演练样本已升级为真实构建记录（RRB-001~RRB-003），并沉淀 artifacts（构建哈希 + 指标快照 + 汇总）。
  - 导师能力看板从 56% 更新到 60%。
- Source:
  - `godot/doc/classes/SceneTree.xml`
  - `godot/scene/main/scene_tree.cpp`
  - `godot/doc/classes/JSON.xml`
  - `godot/core/io/json.cpp`
  - `godot/doc/classes/Viewport.xml`
  - `02_mentor/modules/M10_scene_transition_timer_and_json_resource_runtime.md`
  - `02_mentor/source_quick_answer_map_v1.md`
  - `02_mentor/feature_option_playbook.md`
  - `02_mentor/release_rehearsal_samples_v1.md`
  - `02_mentor/artifacts/rrb_summary_v1.json`
  - `02_mentor/mentor_progress_dashboard.md`

## 2026-02-06

- Topic: 文档入口结构与学习路径梳理
- Summary:
  - 稳定版文档包含 Getting Started、Step by Step、First 2D Game 等完整新手路径。
  - 对当前目标（从零到可发布）应先走 2D 基础，再进入导出与发布链路。
- Source:
  - https://docs.godotengine.org/en/stable/

- Topic: 本地项目信息确认
- Summary:
  - 当前工作目录已包含 Godot 4.6-stable 源码副本。
  - 可同时进行“引擎学习（源码）”和“游戏开发学习（编辑器）”两条线。
- Source:
  - `godot/version.py`
  - `godot` 仓库当前提交标签：`4.6-stable`

- Topic: Godot 四大核心概念（Verified）
- Summary:
  - Godot 游戏可抽象为节点树；核心概念是 Scenes / Nodes / Scene Tree / Signals。
  - Signals 用于低耦合事件通信，避免硬编码依赖。
- Source:
  - https://docs.godotengine.org/en/stable/_sources/getting_started/introduction/key_concepts_overview.rst.txt

- Topic: Nodes vs Scenes 与 Main Scene（Verified）
- Summary:
  - 节点是基础构件，场景是节点树的可复用封装。
  - 项目运行依赖 main scene（F5），单场景调试可用 current scene（F6）。
- Source:
  - https://docs.godotengine.org/en/stable/_sources/getting_started/step_by_step/nodes_and_scenes.rst.txt

- Topic: 脚本语言选择基线（Verified）
- Summary:
  - 新手推荐先用 GDScript（与编辑器集成最好，学习资料最多）。
  - C# 适合已有经验者；C++ 可通过 GDExtension 做高性能扩展，不建议首日就上。
- Source:
  - https://docs.godotengine.org/en/stable/_sources/getting_started/step_by_step/scripting_languages.rst.txt

- Topic: _process(delta) 与帧率无关更新（Verified）
- Summary:
  - `_process(delta)` 每帧回调，`delta` 是上一帧到当前帧时间差。
  - 位置/旋转更新应乘 delta，避免帧率依赖。
- Source:
  - https://docs.godotengine.org/en/stable/_sources/getting_started/step_by_step/scripting_first_script.rst.txt

- Topic: 首作从 2D 开始的官方建议（Verified）
- Summary:
  - 官方明确建议新手先 2D，再转 3D。
  - `Your first 2D game` 是完整入门路径，可作为本阶段主教程线。
- Source:
  - https://docs.godotengine.org/en/stable/_sources/getting_started/first_2d_game/index.rst.txt

- Topic: Day 1 实作验证（Working）
- Summary:
  - 学员已完成安装与项目运行，`F5` 可启动 `first_game`。
  - Input actions `move_left` / `move_right` / `jump` 已创建。
  - 通过调试脚本验证 `Input.is_action_just_pressed("jump")` 生效。
- Source:
  - `01_learner/daily_reports/2026-02-06.md`

- Topic: 长期会话继承架构（Working）
- Summary:
  - 已建立快照优先的恢复链路：handoff -> current_state -> knowledge_map。
  - 目标是应对多年规模数据增长，避免每次会话全量扫描。
- Source:
  - `00_meta/kb_architecture.md`
  - `03_sessions/handoff_latest.md`

- Topic: 导师知识扩展路线（Working）
- Summary:
  - 已补充图形学基础路线和引擎深潜路线，后续按阶段逐步填充可验证内容。
- Source:
  - `02_mentor/graphics_foundations.md`
  - `02_mentor/engine_deep_dive_plan.md`

- Topic: 引擎主循环源码链路（Verified）
- Summary:
  - `Main::start()` 会创建并设置 `MainLoop`（默认 `SceneTree`）。
  - `Main::iteration()` 每帧推进 physics/process/render，形成回调执行的时间语义。
- Source:
  - `godot/main/main.cpp` (`Main::start`, `Main::iteration`)

- Topic: SceneTree 帧内管线（Verified）
- Summary:
  - `SceneTree::physics_process` / `SceneTree::process` 都会处理消息队列、timer/tween、删除队列。
  - 这解释了很多“延后到帧末生效”的行为（如 queue_free）。
- Source:
  - `godot/scene/main/scene_tree.cpp` (`physics_process`, `process`, `process_timers`, `process_tweens`)

- Topic: Node 生命周期与自动 process 注册（Verified）
- Summary:
  - READY 通知阶段会根据脚本是否重写 `_process`/`_physics_process` 自动调用 `set_process`/`set_physics_process`。
  - 生命周期传播链：enter_tree -> ready -> exit_tree。
- Source:
  - `godot/scene/main/node.cpp` (`NOTIFICATION_READY`, `_propagate_enter_tree`, `_propagate_ready`, `_propagate_exit_tree`)

- Topic: InputMap/CharacterBody2D 核心 API 定位（Verified）
- Summary:
  - InputMap 核心接口：`add_action`, `action_add_event`, `event_is_action`, `load_from_project_settings`。
  - CharacterBody2D 运动核心：`move_and_slide`, `velocity`, `is_on_floor`。
- Source:
  - `godot/core/input/input_map.cpp`
  - `godot/scene/2d/physics/character_body_2d.cpp`

- Topic: 长期导师知识库结构升级（Working）
- Summary:
  - 新增 `indexes/ modules/ cards/ qa/` 四层结构，支持多年扩展与快速检索。
  - 新增“学习下godot”触发协议，保证新 AI 直接进入导师学习模式。
- Source:
  - `00_meta/mentor_knowledge_schema.md`
  - `02_mentor/expert_study_protocol.md`
  - `AGENTS.md`

## Next Reading Queue

1. Getting Started -> Introduction to Godot
2. Step by Step -> Nodes and Scenes
3. Step by Step -> Scripting languages
4. Your first 2D game -> 01~03
5. Manual -> Best practices -> Project organization

## Next Reading Queue (Expert Track)

1. `godot/doc/classes/CharacterBody2D.xml`
2. `godot/doc/classes/Node.xml`
3. `godot/doc/classes/SceneTree.xml`
4. `godot/core/input/input_map.cpp` 深读事件匹配细节
5. `godot/scene/2d/physics/character_body_2d.cpp` 运动求解细节
