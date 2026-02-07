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
  - Current: F001~F035
  - Output: `02_mentor/feature_option_playbook.md`
- [done] Build source quick-answer map (question -> class -> function chain -> evidence)
  - Output: `02_mentor/source_quick_answer_map_v1.md` (70 高频问题)
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

## P2 (mid term)

- 2D graphics and math fundamentals for gameplay programming
- Performance profiling and frame-time budgeting in Godot
- Steam release engineering checklist with validation steps
- Source-level map for rendering and resource pipeline
