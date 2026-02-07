# Release Rehearsal Samples v1 (Godot 4.6)

Last Updated: 2026-02-07
Status: Working
Version Scope: 4.6

说明：本文件已从“流程演练样本”升级为“真实构建回归记录（本地最小项目 first-game）”。

## Build Identity (shared by all records)

- Engine executable: `D:\software_package\Godot_v4.6-stable_win64.exe`
- Version: `4.6.stable.official.89cea1439`
- SHA256: `63913d01be2c2d1f929b4a626f5347117126b34e9c64cbf350ea9f35a9657ebf`
- Artifact:
  - `02_mentor/artifacts/rrb000_build_identity.json`

## RRB-001 - Startup segment baseline snapshot

- Captured at: `2026-02-07T17:41:49`
- Command profile:
  - `--headless --path projects/first-game --quit-after 180 --benchmark-file ...`
- Key metrics snapshot:
  - `Main::Setup`: `17.979 ms`
  - `Servers`: `24.806 ms`
  - `Scene`: `53.393 ms`
  - `Main::Setup2`: `87.361 ms`
  - `Load Game`: `8.805 ms`
  - `Main::Start`: `9.300 ms`
- Artifact:
  - `02_mentor/artifacts/rrb001_baseline_headless.json`
- Risk link:
  - `R03`, `R04` in `release_risk_matrix_v1.md`（作为后续对比基线）
- Result:
  - `recorded` (real build evidence)

## RRB-002 - Headless quickstart latency (3 runs)

- Captured at: `2026-02-07T17:47:20`
- Command profile:
  - `--headless --path projects/first-game --quit` (repeated 3 times)
- Key metrics snapshot:
  - `avg`: `177.06 ms`
  - `min`: `174.58 ms`
  - `max`: `179.93 ms`
  - `spread`: `5.35 ms`
- Artifact:
  - `02_mentor/artifacts/rrb002_headless_quickstart_3runs.json`
- Risk link:
  - `R02` in `release_risk_matrix_v1.md`（启动路径一致性基线）
- Result:
  - `recorded` (real build evidence)

## RRB-003 - Benchmark stdout parsed snapshot

- Captured at: `2026-02-07T17:47:46`
- Command profile:
  - `--headless --path projects/first-game --benchmark --quit-after 240`
- Key metrics snapshot:
  - `Main::Setup`: `18.003 ms`
  - `Servers`: `19.745 ms`
  - `Scene`: `54.372 ms`
  - `Main::Setup2`: `85.323 ms`
  - `Load Game`: `8.611 ms`
  - `Main::Start`: `9.096 ms`
  - `Main::Cleanup`: `65.613 ms`
- Artifact:
  - `02_mentor/artifacts/rrb003_benchmark_stdout_parsed.json`
- Risk link:
  - `R03` in `release_risk_matrix_v1.md`（性能采样留档）
- Result:
  - `recorded` (real build evidence)

## Consolidated Summary Artifact

- `02_mentor/artifacts/rrb_summary_v1.json`

## Execution Note

- 在当前机器环境中，`--benchmark-file` 与较长 `--quit-after` 组合存在不稳定现象（进程异常结束/超时）；已采用 `--benchmark` stdout 解析作为备份记录路径。
- 该现象目前标记为 `Working` 观察项，不作为 Godot 4.6 行为结论对外传播。

## Next Action

- 把 RRB-001~003 接入每周固定回归，累计 5 次后建立阈值带（均值 +/- 波动区间）。
