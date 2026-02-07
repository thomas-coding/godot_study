# Automated Regression Spec v1 (Godot 4.6)

Last Updated: 2026-02-07
Status: Working
Version Scope: 4.6

目标：定义“可脚本化 + 可回放 + 可比较”的最小自动回归协议。

## Scope (v1)

- 关注三类回归：
  1. 启动与场景流转（boot -> play -> restart）
  2. 资源加载链路（sync/threaded/export）
  3. 性能基线（FPS + 帧时间 + draw call）

## Run Profile

- Build identity:
  - `OS.has_feature("template")`
  - `OS.is_debug_build()`
- Display identity:
  - `DisplayServer.screen_get_refresh_rate()`
  - 当前 V-Sync 模式

## Minimum Metrics

- `Performance.TIME_FPS`
- `Performance.TIME_PROCESS`
- `Performance.TIME_PHYSICS_PROCESS`
- `Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME`
- 至少 2 个 custom monitors（业务相关）

## Test Steps Template

1. 冷启动进入主菜单（记录首帧可交互时间）。
2. 进入 gameplay 场景并运行 30 秒（采样核心指标）。
3. 触发一次资源加载高峰（切场景或批量 spawn）。
4. 返回主菜单并重启流程，比较两次结果偏差。

## Pass Criteria (v1)

- 无崩溃/黑屏/关键资源缺失。
- 指标偏差在阈值内（阈值按项目定义，默认 15%）。
- 关键输入动作（移动/跳跃/确认/返回）全部可执行。

## Storage Convention

- 每次回归保存：
  - 构建信息
  - 场景路径
  - 命令参数快照
  - 指标快照
  - 失败截图/日志链接

建议命名（v1）：

- `rrb000_build_identity.json`（版本 + 可执行文件哈希）
- `rrb00x_<scenario>.json`（单次场景指标）
- `rrb_summary_v1.json`（多样本汇总）

## Capture Notes

- 优先路径：`--benchmark` + stdout 解析 + 结构化 JSON 落盘。
- 备用路径：`--benchmark-file`（若环境稳定可直接写文件）。
- 若遇到工具不稳定，必须在记录中明确标注，并保留可复核的原始输出。

## References

- `godot/doc/classes/Performance.xml`
- `godot/doc/classes/OS.xml`
- `godot/doc/classes/DisplayServer.xml`
- `04_templates/performance_frame_budget_checklist.md`
