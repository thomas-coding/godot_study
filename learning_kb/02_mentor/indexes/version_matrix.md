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
| M05 | module | verified | not_started | 2026-02-06 | `02_mentor/modules/M05_characterbody2d_movement_basics.md` | CharacterBody2D basics |
| M06 | module | planned | not_started | N/A | `02_mentor/indexes/module_index.md` | Camera follow/jitter |
| M07 | module | planned | not_started | N/A | `02_mentor/indexes/module_index.md` | Resource loading/instancing |
| M08 | module | planned | not_started | N/A | `02_mentor/indexes/module_index.md` | Rendering/frame budget |

## Cards

| Artifact | Type | 4.6 | 5.0 | Last Verified | Evidence Anchor | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| K001 | card | verified | not_started | 2026-02-06 | `02_mentor/cards/K001_game_loop_order.md` | Game loop order |
| K002 | card | verified | not_started | 2026-02-06 | `02_mentor/cards/K002_node_ready_auto_process.md` | READY auto process |
| K003 | card | verified | not_started | 2026-02-06 | `02_mentor/cards/K003_inputmap_project_settings.md` | InputMap loading |
| K004 | card | verified | not_started | 2026-02-06 | `02_mentor/cards/K004_characterbody2d_move_and_slide.md` | move_and_slide flow |

## QA

| Artifact | Type | 4.6 | 5.0 | Last Verified | Evidence Anchor | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| QA001 | qa | verified | not_started | 2026-02-06 | `02_mentor/qa/QA001_process_vs_physics_process.md` | process vs physics |
| QA002 | qa | verified | not_started | 2026-02-06 | `02_mentor/qa/QA002_inputmap_verification.md` | Input verification |
| QA003 | qa | verified | not_started | 2026-02-06 | `02_mentor/qa/QA003_f5_run_flow.md` | F5 run flow |

## Update Rule

- 当触发版本迁移时，先新增目标版本列，再按协议回填状态，不删除旧版本列。
