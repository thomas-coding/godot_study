# godot_study

个人 Godot 学习与项目仓库（长期任务，面向可持续迭代）。

## Quick Start for New AI Session

如果用户说“继续今天学习/继续任务”，请先读取：

1. `learning_kb/03_sessions/handoff_latest.md`
2. `learning_kb/01_learner/current_state.md`
3. `learning_kb/02_mentor/knowledge_map.md`
4. `learning_kb/00_plan/roadmap.md`
5. `learning_kb/00_meta/version_registry.md`
6. `learning_kb/03_sessions/session_protocol.md`

说明：详细强制规则见仓库根目录 `AGENTS.md`。

## Trigger Phrases

- `继续今天学习` / `继续任务`：进入学习执行模式（按 handoff 接续）。
- `学习下godot`：进入导师学习模式（先列模块学习计划，再学习并回写知识库）。
- `更新知识库到godot X.Y`：进入版本迁移模式（切换知识库基线并回填兼容矩阵）。

## Versioned Knowledge Base

- 当前激活版本与迁移历史：`learning_kb/00_meta/version_registry.md`
- 版本迁移协议：`learning_kb/00_meta/version_upgrade_protocol.md`
- 导师知识版本兼容矩阵：`learning_kb/02_mentor/indexes/version_matrix.md`

## Project Layout

- `projects/`：游戏项目代码
- `learning_kb/`：学习知识库（计划、日报、交接、导师知识）
- `godot/`：Godot 源码副本（默认不改动）

## GitHub Sync Default

- remote: `origin = https://github.com/thomas-coding/godot_study`
- branch: `master`
- 用户说“更新到 github / 提交并上传”时，默认提交学习相关变更并推送到 `origin/master`。
