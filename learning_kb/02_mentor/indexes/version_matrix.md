# Version Compatibility Matrix

Last Updated: 2026-02-22
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
| M09 | module | verified | not_started | 2026-02-07 | `02_mentor/modules/M09_scenetree_persistence_and_runtime_render_controls.md` | Group orchestration + persistence boundary + runtime render controls |
| M10 | module | verified | not_started | 2026-02-07 | `02_mentor/modules/M10_scene_transition_timer_and_json_resource_runtime.md` | Scene transition timing + timer order + JSON runtime semantics |
| M11 | module | verified | not_started | 2026-02-08 | `02_mentor/modules/M11_signal_gui_input_and_pause_aware_processing.md` | Signal dispatch + GUI input + pause-aware processing |
| M12 | module | verified | not_started | 2026-02-18 | `02_mentor/modules/M12_area2d_collision_layers_and_interaction_flow.md` | Area2D interaction flow + layer/mask + safe removal timing |
| M13 | module | verified | not_started | 2026-02-19 | `02_mentor/modules/M13_input_dispatch_pause_gates_and_scene_reload_semantics.md` | Input dispatch order + pause gates + scene reload scope |
| M14 | module | verified | not_started | 2026-02-22 | `02_mentor/modules/M14_level_transition_consistency_and_handoff_boundaries.md` | Level transition consistency + scene_changed + state boundary |

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
| K027 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K027_projectsettings_max_fps_startup_only.md` | startup-only max_fps setting |
| K028 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K028_vsync_mode_runtime_fallback_rules.md` | runtime vsync fallback rules |
| K029 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K029_resourceloader_list_directory_semantics.md` | list_directory semantics |
| K030 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K030_configfile_key_space_pitfall.md` | ConfigFile key naming pitfall |
| K031 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K031_fileaccess_flush_tradeoff.md` | FileAccess flush trade-off |
| K032 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K032_scenetree_group_call_unique_requires_deferred.md` | GROUP_CALL_UNIQUE requires deferred |
| K033 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K033_scenetree_group_call_reverse_order.md` | GROUP_CALL_REVERSE order semantics |
| K034 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K034_packedscene_pack_owner_boundary.md` | pack owner boundary |
| K035 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K035_json_parse_vs_parse_string_error_handling.md` | JSON parse diagnostics path |
| K036 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K036_viewport_runtime_aa_pixel_snap_controls.md` | runtime AA and pixel-snap controls |
| K037 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K037_scene_change_two_phase_commit.md` | scene change two-phase commit timing |
| K038 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K038_scene_change_main_thread_guard.md` | scene change file/reload main-thread guard |
| K039 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K039_scenetree_timer_updates_after_nodes.md` | SceneTree timer updates after nodes |
| K040 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K040_json_resource_loader_editor_runtime_branch.md` | JSON resource loader editor/runtime branch |
| K041 | card | verified | not_started | 2026-02-07 | `02_mentor/cards/K041_json_resource_save_prefers_parsed_text.md` | JSON resource save prefers parsed text |
| K042 | card | verified | not_started | 2026-02-08 | `02_mentor/cards/K042_signal_connect_reference_counted_duplicates.md` | signal connect duplicate behavior |
| K043 | card | verified | not_started | 2026-02-08 | `02_mentor/cards/K043_signal_one_shot_and_deferred_dispatch.md` | one-shot and deferred signal dispatch |
| K044 | card | verified | not_started | 2026-02-08 | `02_mentor/cards/K044_control_gui_input_accept_event_flow.md` | Control gui input and accept_event flow |
| K045 | card | verified | not_started | 2026-02-08 | `02_mentor/cards/K045_node_can_process_pause_mode_gate.md` | Node can_process pause-mode gate |
| K046 | card | verified | not_started | 2026-02-08 | `02_mentor/cards/K046_node_input_processing_group_registration.md` | input processing group registration |
| K047 | card | verified | not_started | 2026-02-18 | `02_mentor/cards/K047_area2d_overlap_cache_updates_per_physics_step.md` | Area2D overlap cache update cadence |
| K048 | card | verified | not_started | 2026-02-18 | `02_mentor/cards/K048_area2d_monitoring_monitorable_gate.md` | Area2D monitoring vs monitorable gates |
| K049 | card | verified | not_started | 2026-02-18 | `02_mentor/cards/K049_area2d_monitoring_change_requires_deferred_in_signal.md` | monitoring mutation requires deferred in signal |
| K050 | card | verified | not_started | 2026-02-18 | `02_mentor/cards/K050_collision_layer_mask_bit_rules.md` | layer/mask bit rules |
| K051 | card | verified | not_started | 2026-02-18 | `02_mentor/cards/K051_area2d_shape_index_to_node_mapping.md` | shape index to node mapping |
| K052 | card | verified | not_started | 2026-02-19 | `02_mentor/cards/K052_viewport_input_dispatch_order_and_handled_stop.md` | Viewport input dispatch order and handled stop |
| K053 | card | verified | not_started | 2026-02-19 | `02_mentor/cards/K053_scenetree_input_dispatch_checks_can_process.md` | SceneTree input dispatch can_process gate |
| K054 | card | verified | not_started | 2026-02-19 | `02_mentor/cards/K054_process_mode_inherit_can_break_pause_expectation.md` | process_mode inherit pause pitfall |
| K055 | card | verified | not_started | 2026-02-19 | `02_mentor/cards/K055_reload_current_scene_uses_current_scene_file_path.md` | reload_current_scene main-thread and path flow |
| K056 | card | verified | not_started | 2026-02-19 | `02_mentor/cards/K056_scene_reload_resets_scene_local_but_not_autoload.md` | reload reset scope vs autoload |
| K057 | card | verified | not_started | 2026-02-22 | `02_mentor/cards/K057_scene_changed_is_post_switch_safe_hook.md` | scene_changed as post-switch safe hook |
| K058 | card | verified | not_started | 2026-02-22 | `02_mentor/cards/K058_current_scene_null_window_during_scene_switch.md` | current_scene null window during scene switch |
| K059 | card | verified | not_started | 2026-02-22 | `02_mentor/cards/K059_change_scene_error_codes_for_fallback.md` | change_scene_to_file error codes and fallback |
| K060 | card | verified | not_started | 2026-02-22 | `02_mentor/cards/K060_reload_current_scene_uses_current_scene_file_path.md` | reload_current_scene routes via current scene file path |
| K061 | card | verified | not_started | 2026-02-22 | `02_mentor/cards/K061_root_contains_current_scene_and_autoload_children.md` | root contains current_scene and autoload siblings |

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
| QA026 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA026_projectsettings_vs_engine_max_fps.md` | ProjectSettings vs Engine max_fps |
| QA027 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA027_deterministic_directory_traversal.md` | deterministic directory traversal |
| QA028 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA028_configfile_key_with_spaces_issue.md` | ConfigFile spaces issue |
| QA029 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA029_flush_frequency_strategy.md` | flush frequency strategy |
| QA030 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA030_web_userfs_persistence_fallback.md` | Web userfs persistence fallback |
| QA031 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA031_group_call_unique_without_deferred.md` | GROUP_CALL_UNIQUE with deferred |
| QA032 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA032_group_call_order_reverse_usage.md` | group reverse/deferred order |
| QA033 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA033_packedscene_pack_missing_children_owner.md` | pack missing children from owner boundary |
| QA034 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA034_json_parse_error_diagnostics.md` | JSON parse diagnostics |
| QA035 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA035_viewport_runtime_aa_tuning.md` | Viewport runtime AA tuning |
| QA036 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA036_scene_change_access_new_scene_timing.md` | scene change new-scene access timing |
| QA037 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA037_scene_change_thread_context.md` | scene change thread context |
| QA038 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA038_scenetree_timer_update_order.md` | SceneTree timer update order |
| QA039 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA039_json_resource_editor_runtime_difference.md` | JSON resource editor/runtime difference |
| QA040 | qa | verified | not_started | 2026-02-07 | `02_mentor/qa/QA040_json_keep_text_save_behavior.md` | JSON keep_text save behavior |
| QA041 | qa | verified | not_started | 2026-02-08 | `02_mentor/qa/QA041_signal_duplicate_connection_reference_counted.md` | duplicate signal connection and ref-counted mode |
| QA042 | qa | verified | not_started | 2026-02-08 | `02_mentor/qa/QA042_connect_deferred_vs_call_deferred.md` | CONNECT_DEFERRED vs call_deferred |
| QA043 | qa | verified | not_started | 2026-02-08 | `02_mentor/qa/QA043_gui_input_not_triggered_mouse_filter.md` | _gui_input blocked by mouse filter/propagation |
| QA044 | qa | verified | not_started | 2026-02-08 | `02_mentor/qa/QA044_pause_mode_and_timer_behavior.md` | pause mode and timer behavior |
| QA045 | qa | verified | not_started | 2026-02-08 | `02_mentor/qa/QA045_runtime_toggle_input_processing.md` | runtime toggle input processing |
| QA046 | qa | verified | not_started | 2026-02-18 | `02_mentor/qa/QA046_area2d_overlapping_list_not_immediate.md` | Area2D overlap list timing |
| QA047 | qa | verified | not_started | 2026-02-18 | `02_mentor/qa/QA047_area2d_body_entered_not_firing_layer_mask.md` | body_entered layer/mask mismatch |
| QA048 | qa | verified | not_started | 2026-02-18 | `02_mentor/qa/QA048_area2d_toggle_monitoring_inside_callback.md` | toggle monitoring inside callback |
| QA049 | qa | verified | not_started | 2026-02-18 | `02_mentor/qa/QA049_area2d_body_shape_entered_get_shape_node.md` | body_shape_entered shape node mapping |
| QA050 | qa | verified | not_started | 2026-02-18 | `02_mentor/qa/QA050_area2d_body_entered_tilemap_case.md` | body_entered TileMap case |
| QA051 | qa | verified | not_started | 2026-02-19 | `02_mentor/qa/QA051_pause_label_shows_but_player_still_moves.md` | pause label shows but player still moves |
| QA052 | qa | verified | not_started | 2026-02-19 | `02_mentor/qa/QA052_duplicate_hotkey_trigger_in_unhandled_input.md` | same hotkey triggers twice |
| QA053 | qa | verified | not_started | 2026-02-19 | `02_mentor/qa/QA053_restart_called_while_paused.md` | restart from paused state |
| QA054 | qa | verified | not_started | 2026-02-19 | `02_mentor/qa/QA054_reload_current_scene_reset_scope.md` | reload_current_scene reset scope |
| QA055 | qa | verified | not_started | 2026-02-19 | `02_mentor/qa/QA055_input_callback_choice_for_gameplay_hotkeys.md` | input callback choice for gameplay hotkeys |
| QA056 | qa | verified | not_started | 2026-02-22 | `02_mentor/qa/QA056_current_scene_null_right_after_change_scene.md` | current_scene null window after scene switch |
| QA057 | qa | verified | not_started | 2026-02-22 | `02_mentor/qa/QA057_best_hook_for_post_transition_init.md` | post-transition initialization hook choice |
| QA058 | qa | verified | not_started | 2026-02-22 | `02_mentor/qa/QA058_change_scene_failure_handling.md` | change_scene error handling strategy |
| QA059 | qa | verified | not_started | 2026-02-22 | `02_mentor/qa/QA059_scene_local_vs_autoload_state_boundary.md` | scene-local vs autoload state boundary |
| QA060 | qa | verified | not_started | 2026-02-22 | `02_mentor/qa/QA060_restart_semantics_in_multi_level_flow.md` | restart semantics in multi-level flow |

## Update Rule

- 当触发版本迁移时，先新增目标版本列，再按协议回填状态，不删除旧版本列。
