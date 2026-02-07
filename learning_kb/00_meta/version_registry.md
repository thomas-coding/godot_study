# Version Registry

Last Updated: 2026-02-07

## Active Baseline

- Engine: `Godot 4.6`
- Source Baseline: `godot` local clone on branch/tag `4.6-stable`
- Docs Baseline: `https://docs.godotengine.org/en/stable/`
- Baseline State: `active`
- Migration State: `steady`
- Effective Since: `2026-02-06`

## Trigger Phrases

- `更新知识库到godot X.Y`
- `升级知识库到 X.Y`
- `切换到 Godot X.Y`

## Policy

- 默认教学与结论优先引用 Active Baseline。
- 旧版本知识不删除，只做版本标记与兼容说明。
- 版本迁移允许分多天完成，期间状态标记为 `in_migration`。

## Migration Status Scale

- `steady`: 无迁移进行中。
- `in_migration`: 已切换目标版本，矩阵正在回填。
- `blocked`: 迁移受阻（缺文档、缺源码、工具不可用等）。

## Version Timeline

| Date | Action | From | To | Migration State | Notes |
| --- | --- | --- | --- | --- | --- |
| 2026-02-06 | Initial baseline established | N/A | 4.6 | steady | Day 1 setup completed |
| 2026-02-07 | Added versioned KB architecture | 4.6 | 4.6 | steady | Added registry/protocol/matrix |

## Next Planned Target

- None (wait for user trigger).
