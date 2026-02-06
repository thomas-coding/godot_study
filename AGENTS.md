# AGENT BOOTSTRAP (Must Read First)

如果你是新会话的 AI，并且用户说“继续今天学习/继续任务”，请先执行下面步骤，再回复用户。

## 1) 必读文件（按顺序）

1. `learning_kb/03_sessions/handoff_latest.md`
2. `learning_kb/01_learner/current_state.md`
3. `learning_kb/02_mentor/knowledge_map.md`
4. `learning_kb/00_plan/roadmap.md`
5. `learning_kb/03_sessions/session_protocol.md`

## 2) 启动规则

- 不要先问泛问题，先基于以上文件给出“今日计划 + 第一步动作”。
- 以最小可运行结果为优先。
- 若用户说“用英文回答”，使用英文主答并附术语说明（固定表达/专业术语 + 中文解释）。

## 3) 会话结束时必须更新

1. `learning_kb/01_learner/daily_reports/YYYY-MM-DD.md`
2. `learning_kb/01_learner/current_state.md`
3. `learning_kb/01_learner/mastery_map.md` / `learning_kb/01_learner/gap_backlog.md`
4. `learning_kb/02_mentor/docs_digest.md`
5. `learning_kb/03_sessions/handoff_latest.md`

## 4) 项目范围约束

- 代码项目主目录：`projects/`
- 学习知识库主目录：`learning_kb/`
- 引擎源码目录 `godot/` 默认不改动（除非用户明确要求）。

## 5) GitHub 同步约定

- 远程仓库：`origin = https://github.com/thomas-coding/godot_study`
- 默认分支：`master`
- 当用户说“更新到 github / 提交并上传”时：
  1. 提交本次学习相关变更（排除 `godot/` 与临时文件）
  2. 推送到 `origin/master`
- 未经用户明确要求，不主动 push。
