# Release Risk Matrix v1 (Godot 4.6)

Last Updated: 2026-02-08
Status: Working
Version Scope: 4.6

评分规则：

- Probability (P): 1-5
- Impact (I): 1-5
- Risk Score = `P * I`

## Top Risks

| Risk ID | Risk | P | I | Score | Trigger Signal | Mitigation | Verification | Rehearsal Status |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R01 | Export 后资源加载失败 | 3 | 5 | 15 | `load` 返回空资源/路径缺失 | 明确 `ResourceLoader` 策略 + 检查 `convert_text_resources_to_binary` | `export_runtime_resource_loading_checklist` | RRS-001 mitigated |
| R02 | V-Sync/FPS 配置误解导致帧率异常 | 3 | 4 | 12 | FPS cap 与预期不一致 | 运行时统一入口：`window_set_vsync_mode` + `Engine.max_fps` | 记录刷新率与实际 FPS | RRS-002 mitigated + RRB-002/RRB-004 + threshold |
| R03 | release 性能指标不可见导致误判 | 4 | 3 | 12 | monitor 返回 0 | 增加 custom monitor + 关键日志采样 | `QA016` 验证路径 | RRB-001/RRB-003/RRB-005 + threshold |
| R04 | 线程加载误用导致卡顿峰值 | 3 | 4 | 12 | 加载阶段帧时间尖峰 | 严格 status->get 流程，A/B 测 `use_sub_threads` | `performance_casebook_v1` P003 | baseline recorded (partial) |
| R05 | 存档/配置未持久化 | 2 | 5 | 10 | 重启后配置丢失 | `ConfigFile` 落盘时机规范 + pre-exit save | 手动重启回归 | RRS-003 mitigated |

## Release Gate Rule

- Score >= 15: 必须修复后发布。
- 10 <= Score < 15: 至少要有缓解措施与验证记录。
- Score < 10: 可接受风险，进入观察列表。

## References

- `04_templates/windows_release_preflight_checklist.md`
- `04_templates/export_runtime_resource_loading_checklist.md`
- `02_mentor/performance_casebook_v1.md`
- `02_mentor/release_rehearsal_samples_v1.md`
- `02_mentor/artifacts/rrb_summary_v1.json`
- `02_mentor/artifacts/rrb_threshold_band_v1.json`
