# QA Index

Last Updated: 2026-02-22
Active Baseline: 4.6

Compatibility Matrix: `02_mentor/indexes/version_matrix.md`

- QA001 `what is the real difference between _process and _physics_process` — `02_mentor/qa/QA001_process_vs_physics_process.md`
- QA002 `how to verify Input Map actually works` — `02_mentor/qa/QA002_inputmap_verification.md`
- QA003 `what happens when pressing F5 to run project` — `02_mentor/qa/QA003_f5_run_flow.md`
- QA004 `why queue_free is not immediate` — `02_mentor/qa/QA004_queue_free_not_immediate.md`
- QA005 `physics delta and step cap` — `02_mentor/qa/QA005_physics_delta_and_step_cap.md`
- QA006 `which input callback for gameplay` — `02_mentor/qa/QA006_gameplay_input_callback_choice.md`
- QA007 `move_and_slide speed mismatch` — `02_mentor/qa/QA007_move_and_slide_speed_mismatch.md`
- QA008 `camera jitter from callback mismatch` — `02_mentor/qa/QA008_camera_follow_jitter_callback_mismatch.md`
- QA009 `why _ready is not called again` — `02_mentor/qa/QA009_ready_not_called_again.md`
- QA010 `camera smoothing immediate update` — `02_mentor/qa/QA010_camera_smoothing_limit_force_update.md`
- QA011 `load vs threaded_request choice` — `02_mentor/qa/QA011_load_vs_threaded_request_choice.md`
- QA012 `threaded loading still hitches` — `02_mentor/qa/QA012_threaded_get_hitch_reason.md`
- QA013 `performance monitor zero in release` — `02_mentor/qa/QA013_performance_monitors_release_zero.md`
- QA014 `higher physics ticks but slower feel` — `02_mentor/qa/QA014_physics_ticks_slow_motion_effect.md`
- QA015 `runtime load fails in export` — `02_mentor/qa/QA015_runtime_load_in_export_fail.md`
- QA016 `custom monitor for release metrics` — `02_mentor/qa/QA016_custom_monitor_for_release_metrics.md`
- QA017 `use_sub_threads trade-off` — `02_mentor/qa/QA017_use_sub_threads_tradeoff.md`
- QA018 `exists true but not on disk` — `02_mentor/qa/QA018_exists_true_but_not_on_disk.md`
- QA019 `detect editor/template/release runtime` — `02_mentor/qa/QA019_detect_editor_template_release_runtime.md`
- QA020 `fps cap not working under vsync` — `02_mentor/qa/QA020_fps_cap_not_working_under_vsync.md`
- QA021 `ConfigFile changes not saved` — `02_mentor/qa/QA021_configfile_changes_not_saved.md`
- QA022 `directory listing order differs by OS` — `02_mentor/qa/QA022_dir_listing_order_differs_by_os.md`
- QA023 `runtime V-Sync change has no effect` — `02_mentor/qa/QA023_runtime_vsync_change_no_effect.md`
- QA024 `user:// path and persistence` — `02_mentor/qa/QA024_user_data_path_and_persistence.md`
- QA025 `FileAccess resource missing in export` — `02_mentor/qa/QA025_fileaccess_resource_missing_in_export.md`
- QA026 `ProjectSettings max_fps vs Engine.max_fps` — `02_mentor/qa/QA026_projectsettings_vs_engine_max_fps.md`
- QA027 `deterministic directory traversal` — `02_mentor/qa/QA027_deterministic_directory_traversal.md`
- QA028 `ConfigFile key with spaces issue` — `02_mentor/qa/QA028_configfile_key_with_spaces_issue.md`
- QA029 `flush frequency strategy` — `02_mentor/qa/QA029_flush_frequency_strategy.md`
- QA030 `Web userfs persistence fallback` — `02_mentor/qa/QA030_web_userfs_persistence_fallback.md`
- QA031 `GROUP_CALL_UNIQUE needs DEFERRED` — `02_mentor/qa/QA031_group_call_unique_without_deferred.md`
- QA032 `group reverse/deferred call order` — `02_mentor/qa/QA032_group_call_order_reverse_usage.md`
- QA033 `pack missing children from owner boundary` — `02_mentor/qa/QA033_packedscene_pack_missing_children_owner.md`
- QA034 `JSON parse diagnostics path` — `02_mentor/qa/QA034_json_parse_error_diagnostics.md`
- QA035 `Viewport runtime AA tuning entrypoint` — `02_mentor/qa/QA035_viewport_runtime_aa_tuning.md`
- QA036 `scene change new-scene access timing` — `02_mentor/qa/QA036_scene_change_access_new_scene_timing.md`
- QA037 `scene change thread context` — `02_mentor/qa/QA037_scene_change_thread_context.md`
- QA038 `SceneTree timer update order` — `02_mentor/qa/QA038_scenetree_timer_update_order.md`
- QA039 `JSON resource editor/runtime difference` — `02_mentor/qa/QA039_json_resource_editor_runtime_difference.md`
- QA040 `JSON keep_text save behavior` — `02_mentor/qa/QA040_json_keep_text_save_behavior.md`
- QA041 `signal duplicate connection and ref-counted mode` — `02_mentor/qa/QA041_signal_duplicate_connection_reference_counted.md`
- QA042 `CONNECT_DEFERRED vs call_deferred` — `02_mentor/qa/QA042_connect_deferred_vs_call_deferred.md`
- QA043 `_gui_input blocked by mouse filter/propagation` — `02_mentor/qa/QA043_gui_input_not_triggered_mouse_filter.md`
- QA044 `pause mode and timer behavior` — `02_mentor/qa/QA044_pause_mode_and_timer_behavior.md`
- QA045 `runtime toggle input processing` — `02_mentor/qa/QA045_runtime_toggle_input_processing.md`
- QA046 `Area2D overlap list not immediate` — `02_mentor/qa/QA046_area2d_overlapping_list_not_immediate.md`
- QA047 `Area2D body_entered layer/mask mismatch` — `02_mentor/qa/QA047_area2d_body_entered_not_firing_layer_mask.md`
- QA048 `Area2D toggle monitoring inside callback` — `02_mentor/qa/QA048_area2d_toggle_monitoring_inside_callback.md`
- QA049 `Area2D body_shape_entered get shape node` — `02_mentor/qa/QA049_area2d_body_shape_entered_get_shape_node.md`
- QA050 `Area2D body_entered TileMap case` — `02_mentor/qa/QA050_area2d_body_entered_tilemap_case.md`
- QA051 `pause label shows but player still moves` — `02_mentor/qa/QA051_pause_label_shows_but_player_still_moves.md`
- QA052 `same hotkey triggers twice in _unhandled_input` — `02_mentor/qa/QA052_duplicate_hotkey_trigger_in_unhandled_input.md`
- QA053 `restart called while paused state` — `02_mentor/qa/QA053_restart_called_while_paused.md`
- QA054 `reload_current_scene reset scope` — `02_mentor/qa/QA054_reload_current_scene_reset_scope.md`
- QA055 `input callback choice for gameplay hotkeys` — `02_mentor/qa/QA055_input_callback_choice_for_gameplay_hotkeys.md`
- QA056 `current_scene null right after change_scene` — `02_mentor/qa/QA056_current_scene_null_right_after_change_scene.md`
- QA057 `best hook for post-transition init` — `02_mentor/qa/QA057_best_hook_for_post_transition_init.md`
- QA058 `change_scene failure handling` — `02_mentor/qa/QA058_change_scene_failure_handling.md`
- QA059 `scene-local vs autoload state boundary` — `02_mentor/qa/QA059_scene_local_vs_autoload_state_boundary.md`
- QA060 `restart semantics in multi-level flow` — `02_mentor/qa/QA060_restart_semantics_in_multi_level_flow.md`
