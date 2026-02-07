# Version Compatibility Matrix

Last Updated: 2026-02-07
Active Baseline: `4.6`

## Status Legend

- `not_started`: 未迁移
- `planned`: 已计划，未验证
- `working`: 可用但证据不足
- `verified`: 有文档/源码证据
- `changed`: 与旧版本行为存在差异
- `deprecated`: 旧方案被弃用

## Modules

| Artifact | Type | 4.6 | 5.0 | Last Verified | Evidence Anchor | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| M01 | module | verified | not_started | 2026-02-06 | `02_mentor/modules/M01_mainloop_runtime_pipeline.md` | Main loop order |
| M02 | module | verified | not_started | 2026-02-06 | `02_mentor/modules/M02_scene_tree_process_pipeline.md` | SceneTree frame pipeline |
| M03 | module | verified | not_started | 2026-02-06 | `02_mentor/modules/M03_node_lifecycle_and_processing.md` | Node lifecycle |
| M04 | module | verified | not_started | 2026-02-06 | `02_mentor/modules/M04_inputmap_actions.md` | InputMap action system |
| M05 | module | verified | not_started | 2026-02-07 | `02_mentor/modules/M05_characterbody2d_movement_basics.md` | CharacterBody2D basics + Day2 checklist |
| M06 | module | verified | not_started | 2026-02-07 | `02_mentor/modules/M06_camera_follow_and_jitter_diagnosis.md` | Camera follow/jitter diagnosis |
| M07 | module | verified | not_started | 2026-02-07 | `02_mentor/modules/M07_resource_loading_and_scene_instancing.md` | Resource loading and scene instancing |
| M08 | module | verified | not_started | 2026-02-07 | `02_mentor/modules/M08_performance_monitoring_and_frame_budget.md` | Performance monitoring and frame budget |

## Cards

| Artifact | Type | 4.6 | 5.0 | Last Verified | Evidence Anchor | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| K001 | card | verified | not_started | 2026-02-06 | `02_mentor/cards/K001_game_loop_order.md` | Game loop order |
| K002 | card | verified | not_started | 2026-02-06 | `02_mentor/cards/K002_node_ready_auto_process.md` | READY auto process |
| K003 | card | verified | not_started | 2026-02-06 | `02_mentor/cards/K003_inputmap_project_settings.md` | InputMap loading |
| K004 | card | verified | not_started | 2026-02-06 | `02_mentor/cards/K004_characterbody2d_move_and_slide.md` | move_and_slide flow |
| K005 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K005_queue_free_delete_queue_timing.md` | queue_free delete queue timing |
| K006 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K006_move_and_slide_delta_source.md` | move_and_slide delta source |
| K007 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K007_velocity_units_px_per_sec.md` | velocity unit and delta pitfall |
| K008 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K008_camera2d_process_callback_alignment.md` | Camera2D callback alignment |
| K009 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K009_camera2d_screen_center_vs_global_position.md` | screen center vs global position |
| K010 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K010_node_ready_once_and_request_ready.md` | ready lifecycle reuse |
| K011 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K011_resourceloader_cache_mode_reuse.md` | ResourceLoader cache mode reuse |
| K012 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K012_threaded_loading_status_then_get.md` | threaded loading status then get |
| K013 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K013_packedscene_instantiate_notification.md` | PackedScene instantiate notification |
| K014 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K014_performance_monitor_first_triage.md` | performance monitor first triage |
| K015 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K015_engine_physics_tick_step_coupling.md` | physics ticks and step cap coupling |
| K016 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K016_time_ticks_monotonic_for_measurement.md` | monotonic ticks for measurement |
| K017 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K017_performance_time_fps_update_cadence.md` | TIME_FPS update cadence |
| K018 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K018_performance_debug_release_visibility.md` | debug/release monitor visibility |
| K019 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K019_resourceloader_exists_cache_caveat.md` | exists and cache caveat |
| K020 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K020_os_template_vs_debug_build_check.md` | template vs debug build check |
| K021 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K021_fps_cap_vsync_precedence.md` | fps cap and vsync precedence |
| K022 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K022_displayserver_refresh_rate_fallback.md` | refresh rate fallback handling |
| K023 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K023_diraccess_order_nondeterministic.md` | deterministic directory traversal |
| K024 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K024_configfile_save_required_for_persistence.md` | config persistence save rule |
| K025 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K025_fileaccess_export_resource_note.md` | FileAccess export resource caution |
| K026 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K026_vsync_runtime_change_entrypoint.md` | runtime vsync control entrypoint |

## QA

| Artifact | Type | 4.6 | 5.0 | Last Verified | Evidence Anchor | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| QA001 | qa | verified | not_started | 2026-02-06 | `02_mentor/qa/QA001_process_vs_physics_process.md` | process vs physics |
| QA002 | qa | verified | not_started | 2026-02-06 | `02_mentor/qa/QA002_inputmap_verification.md` | Input verification |
| QA003 | qa | verified | not_started | 2026-02-06 | `02_mentor/qa/QA003_f5_run_flow.md` | F5 run flow |
| QA004 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA004_queue_free_not_immediate.md` | queue_free frame-tail deletion |
| QA005 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA005_physics_delta_and_step_cap.md` | physics delta and step cap |
| QA006 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA006_gameplay_input_callback_choice.md` | gameplay input callback choice |
| QA007 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA007_move_and_slide_speed_mismatch.md` | move_and_slide speed mismatch |
| QA008 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA008_camera_follow_jitter_callback_mismatch.md` | camera jitter callback mismatch |
| QA009 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA009_ready_not_called_again.md` | ready one-shot behavior |
| QA010 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA010_camera_smoothing_limit_force_update.md` | camera smoothing immediate update |
| QA011 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA011_load_vs_threaded_request_choice.md` | load vs threaded_request choice |
| QA012 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA012_threaded_get_hitch_reason.md` | threaded loading hitch diagnosis |
| QA013 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA013_performance_monitors_release_zero.md` | performance monitor release behavior |
| QA014 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA014_physics_ticks_slow_motion_effect.md` | physics ticks and slow-motion effect |
| QA015 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA015_runtime_load_in_export_fail.md` | runtime load failure in export |
| QA016 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA016_custom_monitor_for_release_metrics.md` | custom monitor for release metrics |
| QA017 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA017_use_sub_threads_tradeoff.md` | use_sub_threads trade-off |
| QA018 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA018_exists_true_but_not_on_disk.md` | exists true but not on disk |
| QA019 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA019_detect_editor_template_release_runtime.md` | runtime identity detection |
| QA020 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA020_fps_cap_not_working_under_vsync.md` | fps cap under vsync |
| QA021 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA021_configfile_changes_not_saved.md` | config save persistence issue |
| QA022 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA022_dir_listing_order_differs_by_os.md` | directory order drift across OS |
| QA023 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA023_runtime_vsync_change_no_effect.md` | runtime vsync setting behavior |
| QA024 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA024_user_data_path_and_persistence.md` | user data path and persistence |
| QA025 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA025_fileaccess_resource_missing_in_export.md` | FileAccess export resource missing |

## Update Rule

- 当触发版本迁移时，先新增目标版本列，再按协议回填状态，不删除旧版本列。
