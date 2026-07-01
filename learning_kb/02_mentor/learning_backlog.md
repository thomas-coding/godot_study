# Mentor Learning Backlog

目标：把“会教”升级成“可长期复用、可验证、可迭代”的知识体系。

## P0 (next 3 sessions)

- [done] Complete M05 with a teaching-ready Day 2 checklist
  - Output: `02_mentor/modules/M05_characterbody2d_movement_basics.md` + `04_templates/characterbody2d_day2_troubleshooting_checklist.md`
  - Evidence level: `Verified`

- [done] Expand callback timing chain (`MainLoop -> SceneTree -> Node`) into reusable QAs
  - Output: `02_mentor/cards/K005~K006` + `02_mentor/qa/QA004~QA005`
  - Evidence level: `Verified`

- [done] Build troubleshooting checklist (input, collision, gravity, floor checks)
  - Output: `04_templates/characterbody2d_day2_troubleshooting_checklist.md` + `02_mentor/qa/QA006~QA007`
  - Evidence level: `Working -> Verified`

- [done] Grow `qa/` to QA010 for top beginner questions
  - Current: QA001~QA010
  - Output: `02_mentor/qa/QA008~QA010`

## P1 (next 2-4 weeks)

- [done] Camera2D follow jitter diagnostics
  - Output: `02_mentor/modules/M06_camera_follow_and_jitter_diagnosis.md` + `04_templates/camera2d_follow_jitter_checklist.md`
- Scene organization and reusable architecture for small projects
- Save/load baseline pattern (`ConfigFile` vs JSON) for this project
- Prepare first cross-version migration drill (`4.6` -> target) using `version_upgrade_protocol.md`
- [done] Build feature option playbook (for each common feature: 2-3 implementation paths + trade-off)
  - Current: F001~F085
  - Output: `02_mentor/feature_option_playbook.md`
- [done] Build source quick-answer map (question -> class -> function chain -> evidence)
  - Output: `02_mentor/source_quick_answer_map_v1.md` (165 高频问题)
- [done] Build performance/export troubleshooting checklists
  - Output: `04_templates/performance_frame_budget_checklist.md` + `04_templates/export_runtime_resource_loading_checklist.md`
- [done] Build performance casebook baseline
  - Output: `02_mentor/performance_casebook_v1.md` (3 cases)
- [done] Build Windows release preflight regression checklist
  - Output: `04_templates/windows_release_preflight_checklist.md`
- [done] Build release risk matrix baseline
  - Output: `02_mentor/release_risk_matrix_v1.md`
- [done] Build automated regression spec baseline
  - Output: `02_mentor/automated_regression_spec_v1.md`
- [done] Build release rehearsal samples baseline
  - Output: `02_mentor/release_rehearsal_samples_v1.md` (3 real build records)

- [done] Upgrade rehearsal samples to real build records with artifacts
  - Output: `02_mentor/artifacts/rrb000_build_identity.json`, `02_mentor/artifacts/rrb_summary_v1.json`

- [done] Establish regression threshold band from 5 records
  - Output: `02_mentor/artifacts/rrb_threshold_band_v1.json`

- [done] Build Day3 Area2D interaction troubleshooting assets
  - Output: `02_mentor/modules/M12_area2d_collision_layers_and_interaction_flow.md`, `04_templates/area2d_interaction_troubleshooting_checklist.md`, `00_plan/day_03_2h_runbook.md`

- [done] Build Lesson4 teaching prep assets for start/pause/restart flow
  - Output: `02_mentor/modules/M13_input_dispatch_pause_gates_and_scene_reload_semantics.md`, `00_plan/lesson_04_2h_runbook.md`, `04_templates/gameplay_state_pause_restart_troubleshooting_checklist.md`

- [done] Switch learner planning to lesson-based flow and keep 3-lesson prep buffer
  - Output: `00_plan/lesson_queue.md`, `00_plan/lesson_04_2h_runbook.md`, `00_plan/lesson_05_2h_runbook.md`, `00_plan/lesson_06_2h_runbook.md`

- [done] Refill prep buffer after learner reached Lesson 6
  - Output: `00_plan/lesson_08_2h_runbook.md`, `00_plan/lesson_09_2h_runbook.md`, updated `00_plan/lesson_queue.md`

- [done] Refill prep buffer after learner reached Lesson 9
  - Output: `00_plan/lesson_10_2h_runbook.md`, `00_plan/lesson_11_2h_runbook.md`, `00_plan/lesson_12_2h_runbook.md`, updated `00_plan/lesson_queue.md`

- [done] Build Lesson12 scene-transition teaching assets and Q&A pack
  - Output: `02_mentor/modules/M14_level_transition_consistency_and_handoff_boundaries.md`, `02_mentor/cards/K057~K061`, `02_mentor/qa/QA056~QA060`

- [done] Expand quick-answer map to 110 and playbook to F055
  - Output: `02_mentor/source_quick_answer_map_v1.md` (`SQ101~SQ110`), `02_mentor/feature_option_playbook.md` (`F051~F055`)

- [done] Build SceneTreeTimer teaching assets and Q&A pack
  - Output: `02_mentor/modules/M15_scenetreetimer_pause_time_scale_and_update_order.md`, `02_mentor/cards/K062~K066`, `02_mentor/qa/QA061~QA065`

- [done] Expand quick-answer map to 120 and playbook to F060
  - Output: `02_mentor/source_quick_answer_map_v1.md` (`SQ111~SQ120`), `02_mentor/feature_option_playbook.md` (`F056~F060`)

- [done] Build runtime settings teaching assets and Q&A pack
  - Output: `02_mentor/modules/M16_runtime_settings_application_audio_window_inputmap.md`, `02_mentor/cards/K067~K070`, `02_mentor/qa/QA066~QA070`

- [done] Expand quick-answer map to 130 and playbook to F065
  - Output: `02_mentor/source_quick_answer_map_v1.md` (`SQ121~SQ130`), `02_mentor/feature_option_playbook.md` (`F061~F065`)

- [done] Build enemy-event linkage teaching assets and Q&A pack
  - Output: `02_mentor/modules/M17_enemy_event_wave_spawn_and_gate_unlock.md`, `02_mentor/cards/K071~K074`, `02_mentor/qa/QA071~QA075`, `00_plan/lesson_19_2h_runbook.md`

- [done] Expand quick-answer map to 140 and playbook to F070
  - Output: `02_mentor/source_quick_answer_map_v1.md` (`SQ131~SQ140`), `02_mentor/feature_option_playbook.md` (`F066~F070`)

- [done] Build embedded-run diagnostics and modal settings layout teaching assets
  - Output: `02_mentor/modules/M18_embedded_run_window_modes_and_modal_ui_layout.md`, `02_mentor/cards/K075~K078`, `02_mentor/qa/QA076~QA080`, `00_plan/lesson_20_2h_runbook.md`

- [done] Expand quick-answer map to 150 and playbook to F075
  - Output: `02_mentor/source_quick_answer_map_v1.md` (`SQ141~SQ150`), `02_mentor/feature_option_playbook.md` (`F071~F075`)

- [done] Refill prep buffer after learner reached Lesson 14
  - Output: `00_plan/lesson_20_2h_runbook.md`, updated `00_plan/lesson_queue.md`

- [done] Refill prep buffer after learner reached Lesson 18
  - Output: `00_plan/lesson_22_2h_runbook.md`, updated `00_plan/lesson_queue.md`

- [done] Build alpha integration regression and teaching delivery reliability assets
  - Output: `02_mentor/modules/M19_alpha_integration_regression_and_teaching_delivery.md`, `02_mentor/cards/K079~K080`, `02_mentor/qa/QA081~QA082`

- [done] Expand quick-answer map to 160 and playbook to F080
  - Output: `02_mentor/source_quick_answer_map_v1.md` (`SQ151~SQ160`), `02_mentor/feature_option_playbook.md` (`F076~F080`)

- [done] Build Windows export dry-run teaching assets and refill prep buffer after Lesson 20
  - Output: `02_mentor/modules/M20_windows_export_dry_run_and_release_preflight.md`, `02_mentor/cards/K081~K082`, `02_mentor/qa/QA083~QA084`, `00_plan/lesson_23_2h_runbook.md`

- [done] Expand quick-answer map to 165 and playbook to F085
  - Output: `02_mentor/source_quick_answer_map_v1.md` (`SQ161~SQ165`), `02_mentor/feature_option_playbook.md` (`F081~F085`)

- [done] Build Boss encounter boundary teaching assets and refill prep buffer after Lesson 21
  - Output: `02_mentor/modules/M21_boss_encounter_design_and_gate_boundaries.md`, `02_mentor/cards/K083~K084`, `02_mentor/qa/QA085~QA086`, `00_plan/lesson_24_2h_runbook.md`

- [done] Refill local learning curriculum buffer after Lesson 23
  - Output: `00_plan/lesson_25_2h_runbook.md`, `00_plan/lesson_26_2h_runbook.md`, `00_plan/lesson_27_2h_runbook.md`
  - Output: `02_mentor/modules/M22_learning_first_local_godot_curriculum.md`, `02_mentor/cards/K085~K087`, `02_mentor/qa/QA087~QA089`
  - Output: `02_mentor/source_quick_answer_map_v1.md` (`SQ166~SQ170`)

- [done] Refill prep buffer after learner reached Lesson 26
  - Output: `00_plan/lesson_28_2h_runbook.md`, `00_plan/lesson_29_2h_runbook.md`, `00_plan/lesson_30_2h_runbook.md`
  - Output: `02_mentor/modules/M23_feedback_audio_and_data_driven_boundaries.md`
  - Output: `02_mentor/cards/K088~K090`, `02_mentor/qa/QA090~QA092`

## P2 (mid term)

- 2D graphics and math fundamentals for gameplay programming
- Performance profiling and frame-time budgeting in Godot
- Local export/debug-release validation and build identity checks
- Source-level map for rendering and resource pipeline
